//
//  GameListView.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import SwiftUI

struct GameListView: View {
    var games: [Game]

    var body: some View {
        ForEach(games) { game in
            NavigationLink(
                destination: {
                    GameDetailView(game: game)
                },
                label: {
                    GameCell(game: game)
                })
        }
    }
}


struct GameImage: View {
    var gameUrl: URL?
    var body: some View {
        AsyncImage(url: gameUrl) { phase in
            switch phase {
            case .empty:
                ZStack {
                    Color.clear
                    ProgressView()
                }
            case .success(let image):
                image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
            default:
                EmptyView()
            }
        }
    }
}

struct GameCell: View {
    var game: Game
    var body: some View {
        HStack() {
            if game.thumbnailUrl != "" {
                GameImage(gameUrl: game.thumbnail).frame(width: 130)
            }

        }
        VStack(alignment: .center) {
            HStack {
                Text(game.name).font(.title3)
                Spacer()
            }
        }
    }
}

struct GameDetailView: View {
    var game: Game

    var body: some View {
        ScrollView {
            VStack {
                GameImage(gameUrl: game.thumbnail)
                Text(game.name).font(.largeTitle)

                VStack(alignment: .leading) {
                    Text("Description :").font(.title2)
                    Text(game.description.trimmingCharacters(in: .whitespacesAndNewlines)).font(.title3)
                }
            }.padding()

        }
    }
}
