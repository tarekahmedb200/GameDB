//
//  HomeViewModel.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import Foundation


@MainActor
final class HomeViewModel: ObservableObject {
    @Published var gameGenreList : [GameGenre] = []
    private var apiManager : APIManagerProtocol
    
    init(apiManager:APIManagerProtocol) {
        self.apiManager = apiManager
    }
    
    func getGameGenresList() async {
        do {
            gameGenreList = try await apiManager.getGameGenresList(GameGenreRequest())
        } catch {
            print("Error loading animals... \(error.localizedDescription)")
        }
    }
    
}

