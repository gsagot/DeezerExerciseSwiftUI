//
//  TrackServiceFake.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 20/10/2022.
//

import Foundation

class TrackServiceFake: TrackRequester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    // Get all tracks from an Album
    
    func get(url: URL, completion: @escaping (Result<TrackList,ServiceError>) -> Void) {
        
        let bundle = Bundle(for: TrackServiceFake.self)
        let url = bundle.url(forResource: "TrackList", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        guard let result =  try? JSONDecoder().decode(TrackList.self, from: data) else {
            completion (.failure(.JSONException("An error occured, please try again") ) )
            return
        }
        
        completion (.success(result) )
     
        
    }
    
}
