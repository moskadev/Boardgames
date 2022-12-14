//
//  BoardgamesViewModel.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//


import Foundation
import SwiftUI

@MainActor
class BoardgamesViewModel: ObservableObject {
    @Published var searchedGames = [Game]()
    @Published var listGames = [Game]()

    let gameFetcher = GameFetcher()
    var currentPage = 1

    func getGameList() async throws {
        let gameResponse = try await gameFetcher.getGamesList(page: currentPage)
        currentPage += 1;
        listGames.append(contentsOf: gameResponse.games)
    }

    func searchGames(name : String) async throws {
        if(name == "") {
            searchedGames = []
            return
        }
        let gameResponse = try await gameFetcher.getGames(name: name)
        searchedGames = gameResponse.games
    }
}
