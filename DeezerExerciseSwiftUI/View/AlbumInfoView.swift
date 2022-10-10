//
//  ArtistDetailsView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct AlbumInfoView: View {
    
    let artist: DZRArtist
    
    @ObservedObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        
        switch viewModel.state {
            
        case .idle:
            Color.clear.onAppear(){viewModel.search(artist.tracklist) }
        case .loading:
            ProgressView()
        case .failed(_):
            Text("errreuuuurrr")
        case .loaded(let albums):
            VStack{
                Text(artist.name)
                Text(albums.first?.title ?? " ")
                AlbumTrackListView(Albums: albums)
            }
        }
        
    }
    
}

/*
struct ArtistDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailsView(artist: DZRArtist.mock())
    }
}
*/
