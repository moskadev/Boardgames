//
//  SearchView.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: BoardgamesViewModel
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                GameListView(games: viewModel.searchedGames)
            }
                .navigationTitle(Text("Rechercher"))
                .searchable(text: $searchText)
                .onChange(of: searchText) { s in
                    Task {
                        try? await viewModel.searchGames(name: s);
                    }
                }
        }
    }
}
