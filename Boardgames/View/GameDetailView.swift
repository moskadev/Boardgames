//
//  GameDetailView.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import SwiftUI

struct GameDetailView: View {
    var game: Game

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: game.thumbnail) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                    default:
                        EmptyView()
                    }
                }

                // NoteView(percentage: note).frame(width: 100, height: 100)
                Text(game.name).font(.largeTitle)

                VStack(alignment: .leading) {
                    Text("Description :").font(.title2)
                    Text(game.description.trimmingCharacters(in: .whitespacesAndNewlines)).font(.title3)
                }
            }.padding()

        }
    }
}
