//
//  AlbumDetailViewModel.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import Foundation

class TracksViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Track])
    }
    
    @Published private(set) var state = State.idle
    
    var all = [Track]()
    
    var apiRequester: AlbumRequester
    
    init(requester: AlbumRequester = AlbumService()) {
        self.apiRequester = requester
       
    }
    
    func search(_ id: Int) {
        
        state = .loading
                
        let requestURL = URL(string: "http://api.deezer.com/album/" + String(id) )!
        
        apiRequester.get(url: requestURL) {result in
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
    
    func printTest() {
        for i in 0..<all.count {
            print("✅", i, ". ", all[i].title.removeParentheses())
            print("\n")
        }
        
    }
     

    
}
