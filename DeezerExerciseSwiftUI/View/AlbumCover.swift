//
//  AlbumCover.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation
import SwiftUI

struct AlbumCover: View {
    
    var path: String
    
    var body: some View {
        
        ZStack(alignment: .top){
                
                Image("clock")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(1)
            
            
                AsyncImage(url: URL(string: path) ){ phase in
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
                .clipShape(Circle())
                .scaleEffect(0.8)
                .background(.clear)
    
        }
        .background(.clear)
  
    }
    
}
