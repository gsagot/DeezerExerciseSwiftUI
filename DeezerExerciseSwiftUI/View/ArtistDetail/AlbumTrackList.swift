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
 
    @ObservedObject var viewModel: TracksViewModel
    
    var body: some View {
        
        // Create List
        // Switch between states

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
            
        case .failed(let error):
            VStack{
                Text((String(describing: error) ) )
                    .font(.dzrFootnote)
                    .foregroundColor(.red)
                Spacer()
            }
            
        case .loaded(let tracks):
            List(){
                ForEach(tracks, id: \.identifier) { track in

                    TrackCell(track: track, listening: $selected)
                        .onTapGesture {
                            // Switch between Audio state
                            
                            switch AudioPlayer.shared.state {
                                
                                
                            case .playing :
                                
                                // On tap, If not playing this track, play it !
                                if selected?.identifier != track.identifier {
                                    AudioPlayer.shared.start(track.preview)
                                    selected = track
                                }
                                // On tap, If playing this track, stop it !
                                else{
                                    AudioPlayer.shared.stop()
                                    selected = nil
                                }
                                
                            // playing anything so play this track
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

struct AlbumTrackListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumTrackList(current_album: Album.mock(), viewModel: TracksViewModel(requester: AlbumServiceFake() ) )
    }
}
