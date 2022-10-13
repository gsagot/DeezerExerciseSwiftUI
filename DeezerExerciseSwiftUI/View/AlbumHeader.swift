//
//  AlbumHeader.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation
import SwiftUI


struct AlbumHeader: View {
    
    var artistName: String
    var albumTitle : String
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading ){
                Text(artistName)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .font(.dzrLarge)
                    .minimumScaleFactor(0.5)
                    .multilineTextAlignment(.leading)
                
                
                Text(albumTitle.removeParentheses())
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .font(.dzrTitle)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(.pink)
                    .multilineTextAlignment(.leading)
                
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.clear)
        
    }
    
}
