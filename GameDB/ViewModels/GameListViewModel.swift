//
//  GameListViewModel.swift
//  GameDB
//
//  Created by lapshop on 2/25/23.
//

import Foundation

@MainActor
final class GameListViewModel: ObservableObject {
    @Published var gameList : [Game] = []
    
    private var gameGenreId: Int
    private var apiManager : APIManagerProtocol
    
    init(apiManager:APIManagerProtocol,gameGenreId:Int) {
        self.apiManager = apiManager
        self.gameGenreId = gameGenreId
    }
    
    func getGameList(with searchText:String) async {
        do {
            let request = GameListRequest(gameGenreID: gameGenreId,searchText:searchText)
            
            gameList = try await apiManager.getGameList(request)
        } catch {
            print("Error loading animals... \(error.localizedDescription)")
        }
    }
    
}

