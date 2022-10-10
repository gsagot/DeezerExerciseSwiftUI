//
//  AlbumTrackListView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import SwiftUI

struct AlbumTrackListView: View {
    
    var Albums:[Album]
    
    @State private var index: Int = 0
 
    @ObservedObject var viewModel = AlbumDetailViewModel()
    
    var body: some View {
        
        switch viewModel.state {
            
        case .idle:
            Color.clear.onAppear(){viewModel.search(Albums[index].identifier) }
        case .loading:
            ProgressView()
        case .failed(_):
            Text("errreuuuurrr")
        case .loaded(let tracks):
            List(){
                ForEach(tracks, id: \.identifier) { track in
                    Text(track.title)
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
