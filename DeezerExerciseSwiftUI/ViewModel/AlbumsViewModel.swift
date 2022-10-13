//
//  AlbumListViewModel.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 09/10/2022.
//

import Foundation

class AlbumsViewModel:ObservableObject {
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Album])
    }
    
    @Published private(set) var state = State.idle
    
    private var albums = [Album]()

    private var all = [Track]()
    
    private var apiRequester: TrackRequester
    
    init(requester: TrackRequester = TrackService()) {
        self.apiRequester = requester
    }
    
    func search(_ url: String) {
        
        state = .loading
        
        let requestURL = URL(string: url)!
        
        apiRequester.get(url: requestURL) {result in
            switch result {
                
            case .success(let tracks) :
                self.all = tracks.searchResult
                self.albums = self.selectAlbum(tracks: self.all)
                self.state = .loaded(self.albums)
                
            case .failure(let error) :
                self.state = .failed(error)
          
            }
        }
    }
    
    func selectAlbum(tracks: [Track])-> [Album] {
        
        var result = [Album]()
        
        for track in tracks {
            result.append(track.album)
        }
        let test = NSOrderedSet(array: result).array.map({$0 as! Album})
        
        return Array(test)
        
    }

    func printTest() {
        for album in albums {
            print("✅", album)
            print("\n")
        }
        
    }
     
    
}
