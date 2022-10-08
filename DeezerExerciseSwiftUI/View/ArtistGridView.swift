//
//  ContentView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var artistList = ArtistListViewModel()
    
    @State var detail: DZRArtist = DZRArtist.mock()
    @State var searchText: String = " "
    @State var openDetails: Bool = false
    let columns = [GridItem(.adaptive(minimum: 60))]

    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns) {
                ForEach(artistList.all, id: \.identifier) { artist in
                    Button {
                        openDetails = true
                        detail = artist
                    } label: {
                        VStack {
                            //Text(artist.picture) 
                            Text(artist.name)
                        }
                    }
                }
                NavigationLink(" ", isActive: $openDetails) {
                    ArtistDetailsView(artist: detail)
                }
                
            }.navigationTitle("Discover new Artists")
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { searchText in
            artistList.search(searchText.trimmedAndEscaped())
        }
        
        /*
        .onChange(of: searchText) { searchText in
            search(searchText) {
                artists = $0
            }
        }
         */
    }
}
