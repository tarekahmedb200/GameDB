//
//  GameDetailsViewModel.swift
//  GameDB
//
//  Created by lapshop on 2/25/23.
//


import Foundation
import SwiftUI

@MainActor
final class GameDetailsViewModel: ObservableObject {
    @Published var game: Game?
    
    private var gameId: Int
    private var apiManager : APIManagerProtocol
    

    init(apiManager:APIManagerProtocol,gameId:Int) {
        self.apiManager = apiManager
        self.gameId = gameId
    }
    
    func getGameDetails() async {
        do {
            let request = GameDetailsRequest(gameid: gameId)
            game = try await apiManager.getGameDetails(request)
        } catch {
            print("Error loading animals... \(error.localizedDescription)")
        }
    }
    
}
