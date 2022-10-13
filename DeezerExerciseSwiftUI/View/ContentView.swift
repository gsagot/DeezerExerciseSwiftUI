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
    
    @State private var searchText: String = " "
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    
                    if searchText.count < 2 {
                        Circle().fill(.pink)
                            .scaleEffect(0.5)
                        
                    }
                    else {
                        ArtistGridView(artists: viewModel.all)
                    }
                    
                }
            }
            .navigationTitle("Discover new Artists")
            .searchable(text: $searchText)
            .onChange(of: searchText) { searchText in
                searchText.count == 0 ? viewModel.reset() : viewModel.search(searchText.trimmedAndEscaped())
                
            }
            
        }// End Nav
        
    }// End Body
    
}// End Struct




