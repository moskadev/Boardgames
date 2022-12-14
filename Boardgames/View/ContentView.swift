//
//  ContentView.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = BoardgamesViewModel()

    var body: some View {
        TabView {
            BoardView(viewModel: viewModel)
                    .tabItem {
                        Label("Jeux", systemImage: "dice")
                    }
            SearchView(viewModel: viewModel)
                    .tabItem {
                        Label("Recherche", systemImage: "magnifyingglass")
                    }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
