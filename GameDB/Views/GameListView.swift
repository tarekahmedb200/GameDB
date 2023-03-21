//
//  GameListView.swift
//  GameDB
//
//  Created by lapshop on 2/25/23.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var viewModel : GameListViewModel
    
    @State var searchText: String = ""
    
    var body: some View {
        
        GeometryReader { reader in
            ScrollView {
                ForEach(viewModel.gameList,id: \.id) { game in
                    
                    NavigationLink {
                        GameDetailsView(viewModel: GameDetailsViewModel(apiManager: GameDBAPI(), gameId: game.id))
                        
                    } label: {
                        GameRowView(game: game)
                            .frame(width: reader.size.width, height: 200,alignment: .center)
                    }
                }
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Game List")
        .onAppear {
            Task {
                await viewModel.getGameList(with: searchText)
            }
        }.onChange(of: searchText) { newValue in
            Task {
                await viewModel.getGameList(with: newValue)
            }
        }
        
    }
    
    
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView(viewModel: GameListViewModel(apiManager: GameDBAPI(), gameGenreId: 1))
    }
}
