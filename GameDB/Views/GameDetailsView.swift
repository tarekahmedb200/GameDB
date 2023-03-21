//
//  GameDetailsView.swift
//  GameDB
//
//  Created by lapshop on 2/25/23.
//

import SwiftUI

struct GameDetailsView: View {
    
    @ObservedObject var viewModel: GameDetailsViewModel
    
    var body: some View {
        
        GeometryReader { reader in
            ScrollView {
                VStack(alignment:.center,spacing: 5) {
                    AsyncImage(
                        url: URL(string:viewModel.game?.backgroundImage ?? "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png"),
                        content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .border(.blue)
                                .frame(width: reader.size.width, height: reader.size.height/2)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .cornerRadius(10)
                    .clipped()
                    
                    Rectangle()
                        .overlay {
                            VStack(alignment: .center, spacing: 5) {
                                
                                
                                Text(viewModel.game?.name ?? "")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                                    .padding()
                                
                                
                                ScrollView(.horizontal,showsIndicators: false) {
                                    HStack(alignment: .center, spacing: 15) {
                                        ForEach(viewModel.game?.platforms ?? []) { platform in
                                            let platformDetails = platform.platform
                                            Text(platformDetails.name)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                                .lineLimit(nil)
                                                .padding()
                                                .background {
                                                    Color.red
                                                }
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .frame(width: reader.size.width, height: 100,alignment:.center)
                                
                                Text(viewModel.game?.description ?? "")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .lineLimit(nil)
                                    .padding()
                            }
                        }
                        .background {
                            Color.black
                        }
                        .cornerRadius(10)
                        .padding([.leading,.trailing], 2)
                        .frame(width: reader.size.width, height: reader.size.height)
                }
            }
        }
        .navigationBarTitle("Game Details")
        .onAppear {
            Task {
                await viewModel.getGameDetails()
            }
        }
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        GameDetailsView(viewModel: GameDetailsViewModel(apiManager: GameDBAPI(), gameId: 1))
        
        
    }
}
