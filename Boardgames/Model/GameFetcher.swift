//
//  GameFetcher.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import Foundation

class GameFetcher {
    let gamesUrlString = "https://api.boardgameatlas.com/api/search?client_id=Fc52sNGfcO"
    let jsonDecoder = JSONDecoder()

    func getGamesList(page : Int = 1) async throws -> GamesResponse {
        let request = URLRequest(url: URL(string: gamesUrlString + "&skip=\(page * 10 - 10)&limit=10")!)
        let (data, _) = try await URLSession.shared.data(for: request)
        let gameList = try jsonDecoder.decode(GamesResponse.self, from: data)

        return gameList
    }

    func getGames(name : String) async throws -> GamesResponse {
        let request = URLRequest(url: URL(string: gamesUrlString + "&name=\(name)")!)
        let (data, _) = try await URLSession.shared.data(for: request)
        let gameList = try jsonDecoder.decode(GamesResponse.self, from: data)

        return gameList;
    }
}
