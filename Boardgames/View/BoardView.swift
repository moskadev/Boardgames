//
//  BoardView.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import SwiftUI

struct BoardView: View {
    @ObservedObject var viewModel: BoardgamesViewModel
    var body: some View {
        NavigationView {
            List {
                GameListView(games: viewModel.listGames)
                        .navigationTitle(Text("Jeux de société"))
                ProgressView()
                        .onAppear() {
                            Task {
                                try? await viewModel.getGameList()
                            }
                        }
            }
        }
    }
}
