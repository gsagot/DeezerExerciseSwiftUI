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
            GeometryReader{ geo in
                VStack(alignment: .leading ){
                    
                    Text(artistName)
                        .font(.dzrLarge)
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    
                    
                    Text(albumTitle.removeParentheses())
                        .font(.dzrLarge)
                        .minimumScaleFactor(0.1)
                        .foregroundColor(.pink)
                        .multilineTextAlignment(.leading)
            
                    Text("Now playing : ")
                    Text("Title song here ")
                        .foregroundColor(.pink)
                    Image(systemName: "cellularbars")
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 0))
                
            }
            
           
            
        }
        .frame(maxWidth: .infinity)
        .background(.clear)
        
    }
    
}
