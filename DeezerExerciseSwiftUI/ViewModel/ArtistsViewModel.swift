//
//  Model.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

class ArtistsViewModel:ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([DZRArtist])
    }
    
    @Published private(set) var state = State.idle
    
    private var all = [DZRArtist]()
    
    private var apiRequester: ArtistRequester
    
    init(requester: ArtistRequester = ArtistService()) {
        self.apiRequester = requester
    }
    
    func search(_ searchText: String ) {
        
        state = .loading
        
        guard searchText.count >= 3 else { return }
        
        let requestURL = URL(string: "http://api.deezer.com/search/artist?q=" + searchText)!
        
        apiRequester.searchArtist(url: requestURL) { result in
            switch result {
                
            case .success(let artists) :
                self.all = artists.searchResult
                self.state = .loaded(artists.searchResult)
            case .failure(let error) :
                self.state = .failed(error)
                
            }
        }
    }
    
    func reset() {
        all.removeAll()
    }
    
}


    
    
    
