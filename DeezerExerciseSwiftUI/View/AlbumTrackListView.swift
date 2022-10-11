//
//  AlbumTrackListView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import SwiftUI

struct AlbumTrackListView: View {
    
    var current_album:Album
 
    @ObservedObject var viewModel = AlbumDetailViewModel()
    
    var body: some View {
        
        Text("Album Tracks :")
            .padding(10)
            .foregroundColor(.white)
            .font(.largeTitle)
        
        switch viewModel.state {
            
        case .idle:
            Color.black.onAppear(){viewModel.search(current_album.identifier) }
        case .loading:
            VStack{
                ProgressView()
                Spacer()
            }
            
        case .failed(_):
            VStack{
                Text("errreuuuurrr")
                    .foregroundColor(.white)
                Spacer()
            }
        case .loaded(let tracks):
                
            
            ScrollView(){
                ForEach(tracks, id: \.identifier) { track in
                    
                 TrackCellView(title: track.title.removeParentheses())
                      
                }
                
            }
            
        }

    }
}

struct TrackCellView: View {
    
    var title: String
    
    var body: some View {
        
        HStack(){
            Text(title.removeParentheses())
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(10)
        .foregroundColor(.white)
        .background(.clear)
        
    }
    
}



/*
struct AlbumTrackListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumTrackListView()
    }
}
*/
