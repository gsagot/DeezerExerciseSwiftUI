//
//  ContentView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ArtistListViewModel()
    
    @State private var detail: DZRArtist?
    @State private var searchText: String = " "
    @State  private var openDetails: Bool = false
    
    let gridItem:[GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 200))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItem) {
                    ForEach(viewModel.all, id: \.identifier) { artist in
                        Button {
                            openDetails = true
                            detail = artist

                        } label: {
                            VStack{
                                
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
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                
                                Text(artist.name)
                                    .foregroundColor(.white)
                                    .font(.boldFont)
                            }
                        }
                    }
                }
                NavigationLink(" ", isActive: $openDetails) {
                    AlbumInfoView(artist: detail ?? DZRArtist.mock())
                }
            }
            .background(.black)
            .navigationTitle("Discover new Artists")
            .searchable(text: $searchText)
            .onChange(of: searchText) { searchText in
                viewModel.search(searchText.trimmedAndEscaped())
            }
           
           
            
            
        }// End Nav
        
    }// End Body
    
}// End Struct



