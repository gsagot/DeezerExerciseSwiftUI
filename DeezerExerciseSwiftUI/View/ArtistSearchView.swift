//
//  ContentView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Bordas on 30/11/2021.
//
//  Modified by Gilles Sagot on 08/10/2022.

import SwiftUI

struct ArtistSearchView: View {
    
    @ObservedObject var viewModel = ArtistsViewModel()
    
    @State private var searchText: String = " "
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                // Play welcome animation
                
                if searchText.count < 2 {
                    
                    AnimationView()
                 
                    // User is searching ...
                }else {
                    
                    // ... switch between states to update view
                    
                    switch viewModel.state {
                        
                    case .idle:
                        Color.clear
                        
                    case .loading:
                        ProgressView()
                        
                    case .failed(let error):
                        Text((String(describing: error)))
                            .font(.dzrFootnote)
                            .foregroundColor(.red)
                        
                    case .loaded(let artists):
                        ArtistGridView(artists: artists)
                    }
                    
                }
                
            }
            .padding(10)
            .navigationTitle("Discover new Artists")
            .searchable(text: $searchText)
            .onChange(of: searchText) { searchText in
                searchText.count == 0 ? viewModel.reset() : viewModel.search(searchText.trimmedAndEscaped())
                
            }
            
        }// End Nav
        
    }// End Body
    
}// End Struct




