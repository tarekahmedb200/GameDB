//
//  GameRowView.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import SwiftUI

struct GameRowView: View {
    
    var game: Game
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                AsyncImage(
                    url: URL(string: game.backgroundImage),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .border(.blue)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: reader.size.width, height: reader.size.height)
                .overlay {
                    Color.black.opacity(0.5)
                }
                
                VStack(alignment:.center) {
                    Text(game.name)
                        .font(.headline)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                    
                    Text(game.released)
                        .font(.subheadline)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                LinearGradient(colors: [.black,.black.opacity(0.8)], startPoint: .leading, endPoint: .trailing)
            }
            .cornerRadius(5)
        }
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: Game(id: 0, name: "max payne111", released: "", description: "dkmakdmksamdksmakdmsakdmksam", backgroundImage:"https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg", ratings: [], saturatedColor: "", dominantColor: "", platforms: []))
            .previewLayout(.sizeThatFits)
    }
}

