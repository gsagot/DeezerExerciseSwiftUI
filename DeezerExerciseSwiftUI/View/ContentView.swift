//
//  ContentView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ArtistsViewModel()
    
    @State private var detail: DZRArtist?
    @State private var searchText: String = " "
    @State  private var openDetails: Bool = false
    
    let gridItem:[GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 200))]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                GeometryReader { geo in
                    
                    LazyVGrid(columns: gridItem) {
                        
                        ForEach(viewModel.all, id: \.identifier) { artist in
                            
                            Button {
                                openDetails = true
                                detail = artist
                                
                            } label: {
                                
                                ZStack(alignment: .bottom){
                                    
                                    AsyncImage(url: URL(string: artist.picture ) ){ phase in
                                        
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
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    
                                    HStack{
                                        Spacer()
                                        
                                        Text(artist.name)
                                            .foregroundColor(.black)
                                            .font(.dzrHeadline)
                                        Spacer()
                                    }
                                    .background(.white)
                                }
                            }
                        }
                    }
        
                    NavigationLink(" ", isActive: $openDetails) {
                        ArtistDetailView(artist: detail ?? DZRArtist.mock())
                    }
                    .navigationTitle("Discover new Artists")
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { searchText in
                        searchText.count == 0 ? viewModel.reset() : viewModel.search(searchText.trimmedAndEscaped())
                    }
                    
                }
                .background(.white)
            }
            
        }// End Nav
        
    }// End Body
    
}// End Struct



