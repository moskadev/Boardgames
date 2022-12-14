//
//  SearchView.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: BoardGamesViewModel
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                
            }
                .navigationTitle(Text("Rechercher"))
                .searchable(text: $searchText)
                   
        }

    }
}
