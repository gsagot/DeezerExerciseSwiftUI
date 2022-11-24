//
//  AlbumListViewModel.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 09/10/2022.
//

import Foundation


/**
 A class to manage album from an artist tracklist on **  http://api.deezer.com **.
 */

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
    
    private var apiRequester: Requester
    
    init(requester: Requester = TrackService()) {
        self.apiRequester = requester
    }
    
    /**
     Call this function to get artist tracklist  from ** http://api.deezer.com **.
     This function call ** selectAlbum(tracks: [Track])-> [Album] ** to get album list from this track list
     This function updates  **state** class property
     */
    
    func search(_ url: String) {
        
        state = .loading
        
        let requestURL = URL(string: url)!
        
        apiRequester.search(url: requestURL) { (result:Result<TrackList,ServiceError>) in
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
    
    /**
     This function get album from tracklist and return an array 
     */
    
    func selectAlbum(tracks: [Track])-> [Album] {
        
        var result = [Album]()
        
        for track in tracks {
            result.append(track.album)
        }
        let test = NSOrderedSet(array: result).array.map({$0 as! Album})

        return test
        
    }
     
    
}
