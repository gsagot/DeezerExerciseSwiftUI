//
//  Model.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

class ArtistsViewModel:ObservableObject {
    
    @Published var all = [DZRArtist]()
    
    var apiRequester: ArtistRequester
    
    init(requester: ArtistRequester = ArtistService()) {
        self.apiRequester = requester
    }
    
    func search(_ searchText: String ) {
        
        guard searchText.count >= 3 else { return }
        
        let requestURL = URL(string: "http://api.deezer.com/search/artist?q=" + searchText)!
        
        apiRequester.searchArtist(url: requestURL) {success,data in
            if success {
                self.all = data!.searchResult
            } else {
                
            }
        }
    }
    
    func reset() {
        all.removeAll()
    }
    
}


    
    
    
