//
//  TrackCell.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation
import SwiftUI


struct TrackCell: View {
    
    var title: String
    
    var body: some View {
        
        HStack(){
            
            Text(title.removeParentheses())
                .font(.dzrFootnote)
                .multilineTextAlignment(.leading)
            Spacer()
            Image(systemName: "play")
        }
        .padding(10)
        .foregroundColor(.black)
        .background(.clear)
        
    }
    
}
