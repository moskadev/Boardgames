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
                        ScrollView {
                            VStack {
                                Text(game.name).font(.largeTitle)

                                VStack(alignment: .leading) {
                                    Text("Description :").font(.title2)
                                    Text(game.description.trimmingCharacters(in: .whitespacesAndNewlines)).font(.title3)
                                }
                            }.padding()

                        }
                    },
                    label: {
                        HStack() {
                        
                            VStack(alignment: .center) {
                                HStack {
                                    Text(game.name).font(.title3)
                                    Spacer()
                                }
                            }
                    }
                })
        }
    }
}
