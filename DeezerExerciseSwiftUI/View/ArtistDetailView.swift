//
//  ArtistDetailsView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct ArtistDetailView: View {
    
    let artist: DZRArtist
    
    @ObservedObject var viewModel = AlbumsViewModel()
    
    @State private var index: Int = 0
    
    @State private var rotation = 0.0
    
    
    var body: some View {
        
        switch viewModel.state {
            
        case .idle:
            Color.black.onAppear(){viewModel.search(artist.tracklist) }
                .modifier(BackNavigationButton())
            
        case .loading:
            ProgressView()
            
        case .failed(_):
            Text("errreuuuurrr")
            
        case .loaded(let albums):
            
                // SCREEN
                VStack(alignment: .leading) {
                    
                    // HEADER
                    ZStack(alignment: .top){
                        
                        GeometryReader(){ geo in
                            
                            AlbumCover(path: albums[index].cover)
                                .frame(width: geo.size.height, height: geo.size.height)
                                .rotationEffect(.degrees(rotation))
                                .animation(.easeIn, value: rotation)
                                .gesture(
                                    DragGesture()
                                        .onEnded { gesture in
                                            let offset = gesture.translation.height
                                            
                                            if offset > 0 && index > 0{
                                                rotation -= 360
                                                index -= 1
                                            }
                                            else if offset < 0 && index < albums.count - 1 {
                                                rotation += 360
                                                index += 1
                                            }
                                        }
                                )
                                    .offset(x:(geo.size.width)  / 2 )
                            
                            AlbumHeader(artistName: artist.name, albumTitle: albums[index].title)
                                .frame(width: geo.frame(in: .global).midX )
    
                        }
                    }
                    .background(.clear)
                    
                    Spacer()
                    
                    // TRACK LIST
                    AlbumTrackList(current_album: albums[index])
                        .background(.clear)
                    
                }
                .modifier(BackNavigationButton())
                
        }
        
        
    }
    
}

// CUSTOM MODIFIER

struct BackNavigationButton: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.backward.square.fill")
                    
                    Text ("Back")
                }
                
            })
    }
}
