//
//  Game.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation



struct GameListResponse : Codable {
    var gameList : [Game]
    
    enum CodingKeys: String, CodingKey {
        case gameList = "results"
    }
}


struct Game: Codable , Identifiable {

    let id: Int
    let name: String
    let released: String
    let description: String?
    let backgroundImage: String
    let ratings: [Rating]
    let saturatedColor: String
    let dominantColor: String
    let platforms: [Platform]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case backgroundImage = "background_image"
        case ratings
        case saturatedColor = "saturated_color"
        case dominantColor = "dominant_color"
        case platforms
        case description
    }
}
