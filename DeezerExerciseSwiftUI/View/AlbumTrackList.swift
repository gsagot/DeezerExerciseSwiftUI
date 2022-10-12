//
//  AlbumTrackListView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import SwiftUI

struct AlbumTrackList: View {
    
    var current_album:Album
 
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
                    
                    TrackCell(title: track.title.removeParentheses())
                      
                }
                
            }
            
        }

    }
}



/*
struct AlbumTrackListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumTrackListView()
    }
}
*/
