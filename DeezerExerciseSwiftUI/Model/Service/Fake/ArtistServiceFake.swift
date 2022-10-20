//
//  ArtistServiceFake.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 20/10/2022.
//

import Foundation


import Foundation

class ArtistServiceFake: ArtistRequester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    // Search artist
    
    func searchArtist(url: URL, completion: @escaping (Result<ArtistList,ServiceError>) -> Void) {

        let bundle = Bundle(for: ArtistServiceFake.self)
        let url = bundle.url(forResource: "ArtistList", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        guard let result =  try? JSONDecoder().decode(ArtistList.self, from: data) else {
            completion (.failure(.JSONException("An error occured, please try again") ) )
            return
        }
           
        completion (.success(result) )
            
    
    }
    
}

