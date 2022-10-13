//
//  AlbumTrackListView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import SwiftUI

struct AlbumTrackList: View {
    
    var current_album:Album
    
    @State private var selected: Track?
 
    @ObservedObject var viewModel = TracksViewModel()
    
    var body: some View {

        switch viewModel.state {
            
        case .idle:
            Color.clear.onAppear(){viewModel.search(current_album.identifier) }
        case .loading:
            VStack{
                
                Spacer()
                
                HStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
                Spacer()
            }
            
        case .failed(_):
            VStack{
                Text("errreuuuurrr")
                    .foregroundColor(.white)
                Spacer()
            }
        case .loaded(let tracks):
            List(){
                ForEach(tracks, id: \.identifier) { track in

                    TrackCell(track: track, listening: $selected)
                        .onTapGesture {
                            switch AudioPlayer.shared.state {
                                
                            case .playing :
                                
                                if selected?.identifier != track.identifier {
                                    AudioPlayer.shared.start(track.preview)
                                    selected = track
                                }
                                else{
                                    AudioPlayer.shared.stop()
                                    selected = nil
                                }
                                
                            default :
                                AudioPlayer.shared.start(track.preview)
                                selected = track
                            }

                          
                        }
                    
                    
                      
                }
            
                
            }
           
            
            
        }

    }
}

