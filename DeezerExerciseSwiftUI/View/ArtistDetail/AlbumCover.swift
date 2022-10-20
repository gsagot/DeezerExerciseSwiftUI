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
            
            Image("vinyle")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.4)
            
            Image("clock")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.0)
            
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
            .scaleEffect(0.7)
            .background(.clear)
            
            Circle()
                .fill(.black)
                .scaleEffect(0.05)
            
        }
        .background(.clear)
        
    }
    
}
