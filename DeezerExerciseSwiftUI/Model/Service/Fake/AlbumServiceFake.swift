//
//  AlbumServiceFake.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 20/10/2022.
//

import Foundation

class AlbumServiceFake: AlbumRequester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    // Get all tracks from an Album
    
    func get(url: URL, completion: @escaping (Result<AlbumDetail,ServiceError>) -> Void) {
        
        let bundle = Bundle(for: AlbumServiceFake.self)
        let url = bundle.url(forResource: "AlbumDetail", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        guard let result =  try? JSONDecoder().decode(AlbumDetail.self, from: data) else {
            completion (.failure(.JSONException("An error occured, please try again") ) )
            return
        }
           
        completion (.success(result) )
     
        
    }
    
}
