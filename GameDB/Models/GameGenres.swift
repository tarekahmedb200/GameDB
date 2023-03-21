//
//  GameGenres.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation


struct GameGenreResponse : Codable {
    var gameGenres : [GameGenre]
    
    enum CodingKeys: String, CodingKey {
        case gameGenres = "results"
    }
}


struct GameGenre: Codable, Identifiable {
    let id: Int
    let name: String
    let imageBackground: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageBackground = "image_background"
    }
}


