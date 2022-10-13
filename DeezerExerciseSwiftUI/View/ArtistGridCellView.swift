//
//  ArtistGridCellView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 13/10/2022.
//

import SwiftUI

struct ArtistGridCellView: View {
  
    var artist: DZRArtist
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            
            AsyncImage(url: URL(string: artist.picture ) ){ phase in
                
                switch phase {
                    
                case .success(let image):
                    image.resizable()
                    
                case .failure(_):
                    Image(systemName: "questionmark")
                        .symbolVariant(.circle)
                        .font(.largeTitle)
                default:
                    ProgressView()
                }
                
            }
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            
            HStack{
                Spacer()
                
                Text(artist.name)
                    .foregroundColor(.white)
                    .font(.dzrHeadline)
                Spacer()
            }
            .padding(5)
            .background(.pink)
            
            
        }
    }
}
