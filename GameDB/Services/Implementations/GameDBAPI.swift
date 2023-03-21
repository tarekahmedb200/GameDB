//
//  GameDBAPI.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation


class GameDBAPI : APIManagerProtocol {
    
    func getGameGenresList(_ request: RequestProtocol) async throws -> [GameGenre] {
        let (data, _) = try await URLSession.shared.data(for: request.createURLRequest())
        let response = try JSONDecoder().decode(GameGenreResponse.self, from: data)
        return response.gameGenres
    }
    
    func getGameList(_ request: RequestProtocol) async throws -> [Game] {
        let (data, _) = try await URLSession.shared.data(for: request.createURLRequest())
        let response = try JSONDecoder().decode(GameListResponse.self, from: data)
        return response.gameList
    }
    
    func getGameDetails(_ request: RequestProtocol) async throws -> Game {
        let (data, _) = try await URLSession.shared.data(for: request.createURLRequest())
        let game = try JSONDecoder().decode(Game.self, from: data)
        return game
    }
    
    

}
