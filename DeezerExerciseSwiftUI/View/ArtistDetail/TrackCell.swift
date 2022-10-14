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
            
            // Update Button when audio change
            
            switch audioPlayer.state {

            case .playing :
                // Not playing this song
                if listening?.identifier != track.identifier {
                    Text( "▷" )
                }
                // Playing this song
                else {
                    Text( "◻︎" )
                }
                
            // Not playing
            default :
                    Text( "▷" )
                
            }

        }
        .padding(10)
        .background(.clear)
        
        
        
    }

    
}
