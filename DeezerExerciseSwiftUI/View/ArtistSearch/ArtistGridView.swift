//
//  ArtistGridView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 13/10/2022.
//

import Foundation
import SwiftUI


// Artist grid

struct ArtistGridView: View {
    
    var artists: [DZRArtist]
    
    @State private var detail: DZRArtist?
    
    @State  private var openDetails: Bool = false
    
    let gridItem:[GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 200))]
    
    var body: some View{
            
            LazyVGrid(columns: gridItem) {
                
                ForEach(artists, id: \.identifier) { artist in
                    
                    Button {
                        openDetails = true
                        detail = artist
                        
                    } label: {
                        
                            ArtistGridCellView(artist: artist)
                        
                        }
                    }
                }
        
        NavigationLink(" ", isActive: $openDetails) {
            ArtistDetailView(artist: detail ?? DZRArtist.mock())
        }
    }
}
