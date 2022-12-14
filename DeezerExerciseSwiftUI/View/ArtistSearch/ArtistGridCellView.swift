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
            
            // Load picture at given url
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
            
            // Artist Name over picture
            HStack{
                Spacer()
                
                Text(artist.name)
                    .foregroundColor(.white)
                    .bold()
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            .frame(height: 30)
            .padding(5)
            .background(.pink)
            
            
        }
    }
}
