//
//  Model.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

/**
 A class to manage artist search on ** http://api.deezer.com **.
 */

class ArtistsViewModel:ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([DZRArtist])
    }
    
    @Published private(set) var state = State.idle
    
    private var all = [DZRArtist]()
    
    private var apiRequester: Requester
    
    init(requester: Requester = ArtistService()) {
        self.apiRequester = requester
    }
    
    /**
     Call this function to search artist from a string on ** http://api.deezer.com **.
     This function needs a String value to perform search
     This function updates  **state** class property
     
     */
    
    func search(_ searchText: String ) {
        
        state = .idle
        
        guard searchText.count >= 3 else { return }
        state = .loading
        
        let requestURL = URL(string: "http://api.deezer.com/search/artist?q=" + searchText)!
        
        apiRequester.search(url: requestURL) { (result: Result<ArtistList,ServiceError>)  in
            switch result {
                
            case .success(let artists) :
                self.all = artists.searchResult
                self.state = .loaded(artists.searchResult)
            case .failure(let error) :
                self.state = .failed(error)
                
            }
        }
    }
    
}


    
    
    
