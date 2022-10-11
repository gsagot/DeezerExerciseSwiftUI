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
                            
                            AlbumImageView(path: albums[index].cover)
                                .rotationEffect(.degrees(rotation))
                                .animation(.easeIn, value: rotation)
                                .gesture(
                                    DragGesture()
                                    
                                        .onEnded { gesture in
                                            
                                            print(index)
                                            
                                            if gesture.translation.height > 0 && index > 0{
                                                rotation -= 360
                                                index -= 1
                                                
                                            }
                                            else if gesture.translation.height < 0 && index < albums.count - 1 {
                                                rotation += 360
                                                index += 1
                                                
                                            }
                                            
                                        }
                                     
                                )
                                .offset(x:(geo.frame(in: .global).midX ) )
                            
                            AlbumHeaderView(artistName: artist.name, albumTitle: albums[index].title)
                                .frame(width: geo.frame(in: .global).midX )
                        }
                    }
                    
                    Spacer()
                    
                    // TRACK LIST
                    AlbumTrackListView(current_album: albums[index])
                        .background(.clear)
                    
                }
                
                .background(.black)
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
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            })
    }
}

struct AlbumHeaderView: View {
    
    var artistName: String
    var albumTitle : String
    
    var body: some View {
        HStack{
            
            VStack(alignment: .leading ){
                Text(artistName)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
                
                Text(albumTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.clear)
        
    }
    
}

struct AlbumImageView: View {
    
    var path: String
    
    var body: some View {
        
        ZStack{
 
                Circle()
                    .strokeBorder(.white, lineWidth: 5)
                    
            
            
                AsyncImage(url: URL(string: path) ){ phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                    case .failure(_):
                        Image(systemName: "questionmark")
                            .symbolVariant(.circle)
                            .font(.largeTitle)
                        
                    default:
                        ProgressView()
                    }
                    
                }
                .clipShape(Circle())
                .background(.clear)
                .scaleEffect(0.9)
            
                
            
        }
            
        
    
        
        
        
    }
    
}

/*
 HStack {
     Text("Previous")
         .foregroundColor(.white)
         .onTapGesture {
             index = index > 0 ? (index - 1) : index
         }
     Text("Next")
         .foregroundColor(.white)
         .onTapGesture {
             index = index<albums.count - 1 ? (index + 1) : index
         }
 }
 */
