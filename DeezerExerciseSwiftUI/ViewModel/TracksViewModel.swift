//
//  AlbumDetailViewModel.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import Foundation

/**
 A class to manage tracks from an album on  ** http://api.deezer.com **.
 */

class TracksViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Track])
    }
    
    @Published private(set) var state = State.idle
    
    var all = [Track]()
    
    private var apiRequester: Requester
    
    init(requester: Requester = AlbumService()) {
        self.apiRequester = requester
       
    }
    
    /**
     Call this function to get all tracks from an album id ** http://api.deezer.com/album/ **.
     This function needs an id album  to success
     This function updates  **state** class property.
     */
    
    func search(_ id: Int) {
        
        state = .loading
                
        let requestURL = URL(string: "http://api.deezer.com/album/" + String(id) )!
        
        apiRequester.search(url: requestURL) { (result: Result<AlbumDetail,ServiceError>) in
            switch result {
            case .success(let tracks) :
                self.all = tracks.tracks.data
                //self.printTest()
                self.state = .loaded(self.all)
           
            case .failure(let error) :
                self.state = .failed(error)
            }
        }
    }
     

    
}
