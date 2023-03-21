//
//  GameGenreView.swift
//  GameDB
//
//  Created by lapshop on 2/24/23.
//

import SwiftUI

struct GameGenreView: View {
    
    var imageURL: URL
    var genre : String
    
    var body: some View {
        ZStack {
            AsyncImage(
                url: imageURL,
                content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .border(.blue)
                        .frame(width: 150, height: 150)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Rectangle()
                .frame(width: 150, height: 150)
                .background(.black)
                .opacity(0.3)
            
            Text(genre)
                .foregroundColor(.white)
                .font(.title2)
        }
        .cornerRadius(10)
        .shadow(color: .black, radius: 4)
        
    }
}

struct GameGenreView_Previews: PreviewProvider {
    static var previews: some View {
        GameGenreView(imageURL: URL(string: "https://media.rawg.io/media/games/c4b/c4b0cab189e73432de3a250d8cf1c84e.jpg")!, genre: "Action")
            .previewLayout(.sizeThatFits)
    }
    
}
