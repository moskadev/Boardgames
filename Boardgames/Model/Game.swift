//
//  Game.swift
//  Boardgames
//
//  Created by Maxime MOSKALYK on 14/12/2022.
//

import Foundation


struct Game: Identifiable, Hashable {
    let id: String
    let name: String
    let price: String
    let yearPublished: Int
    let minPlayers: Int
    let maxPlayers: Int
    let minPlaytime: Int
    let maxPlaytime: Int
    let description: String
    let imageUrl: String
    let thumbnailUrl: String
    let voteAverage: Double

    var image: URL {
        URL(string: imageUrl)!
    }

    var thumbnail: URL {
        URL(string: thumbnailUrl)!
    }

    static var empty: Game {
        Game(id: "0", name: "", price: "0.0", yearPublished: 0, minPlayers: 0, maxPlayers: 0, minPlaytime: 0, maxPlaytime: 0, description: "N/A", imageUrl: "", thumbnailUrl: "", voteAverage: 0.0)
    }
}

extension Game: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case yearPublished = "year_published"
        case minPlayers = "min_players"
        case maxPlayers = "max_players"
        case minPlaytime = "min_playtime"
        case maxPlaytime = "max_playtime"
        case description = "description_preview"
        case imageUrl = "image_url"
        case thumbnailUrl = "thumb_url"
        case voteAverage = "average_user_rating"
    }
}


struct GamesResponse: Codable {
    let games: [Game]
}
