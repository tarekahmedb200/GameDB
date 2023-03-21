//
//  HomeView.swift
//  GameDB
//
//  Created by lapshop on 2/20/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()) , GridItem(.flexible())]) {
                    
                    ForEach(viewModel.gameGenreList) { genre in
                        
                        NavigationLink {
    
                            GameListView(viewModel: GameListViewModel(apiManager: GameDBAPI(), gameGenreId: genre.id))
                        } label: {
                            GameGenreView(
                                imageURL: URL(string: genre.imageBackground)!,
                                genre: genre.name)
                        }
                    }
                }
            }
            .background{
                RadialGradient(gradient:
                                Gradient(colors:
                                            [.black, .black.opacity(0.9)]), center: .center, startRadius: 20, endRadius: 200)
            }
            .navigationTitle("Game Genre")
        }
        .onAppear {
            Task {
                await viewModel.getGameGenresList()
            }
        }
        
        
    }
    
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(apiManager: GameDBAPI()))
    }
}
