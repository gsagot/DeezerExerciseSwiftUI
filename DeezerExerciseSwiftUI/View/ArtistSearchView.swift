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
    
    @State private var animationAmount = 1.0
    
    @State private var searchText: String = " "
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                if searchText.count < 2 {
                    ZStack{
                        Image("vinyle")
                            .resizable()
                            .scaledToFill()
                        VStack{
                            Text("[deezer]")
                            Text("api")
                        }
                            .onAppear(){
                                animationAmount += 360
                            }
                            .foregroundColor(.pink)
                            .font(.dzrTitle)
                            .rotationEffect(Angle(degrees: animationAmount))
                            .animation(
                                .linear(duration: 3)
                                    .repeatForever(autoreverses: false),
                                value: animationAmount
                            )
                        
                        Circle()
                            .fill(.black)
                            .scaleEffect(0.03)
                    }
                   
                    
                }else {
                    ArtistGridView(artists: viewModel.all)
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




