//
//  APIProtocol.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation

protocol APIManagerProtocol {
    func getGameGenresList(_ request: RequestProtocol) async throws -> [GameGenre]
    func getGameList(_ request: RequestProtocol) async throws -> [Game]
    func getGameDetails(_ request: RequestProtocol) async throws -> Game
}
