//
//  GameDBApp.swift
//  GameDB
//
//  Created by lapshop on 2/20/23.
//

import SwiftUI

@main
struct GameDBApp: App {
    var body: some Scene {
        WindowGroup {
           HomeView(viewModel: HomeViewModel(apiManager: GameDBAPI()))
        }
    }
}
