//
//  TrackCell.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation
import SwiftUI

class UserSettings: ObservableObject {
    @Published var score:Int = 0
}

struct TrackCell: View {

    var track: Track
    
    @Binding var listening: Track?
    
    @State var selected: Bool = false
    
    @ObservedObject var audioPlayer = AudioPlayer.shared
    
    
    var body: some View {
        
        HStack(){
            
            Text(track.title.removeParentheses())
                .bold()
                .multilineTextAlignment(.leading)
            Spacer()
            
            switch audioPlayer.state {
                
            case .playing :
                
                if listening?.identifier != track.identifier {
                    Text( "▷" )
                }
                else {
                    Text( "◻︎" )
                }
            default :
                    Text( "▷" )
                
            }

        }
        .padding(10)
        .foregroundColor(.black)
        .background(.clear)
        
        
        
    }

    
}
