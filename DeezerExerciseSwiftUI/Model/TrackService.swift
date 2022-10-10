//
//  File.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 09/10/2022.
//

import Foundation


class TrackService: TrackRequester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    func getArtistTopTracks(url: URL, completion: @escaping (Result<TrackList,ServiceError>) -> Void) {
        
        let request = URLRequest(url: url)
        
        task?.cancel()
        
        task = session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    print ("ERROR: \(String(describing: error?.localizedDescription))")
                    completion (.failure(.DataException))
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print ("ERROR: \(String(describing: response))")
                    completion (.failure(.QueryException))
                    return
                }
                guard let result = try? JSONDecoder().decode(TrackList.self, from: data) else {
                    print("JSON ERROR: \(String(describing: error?.localizedDescription))")
                    completion (.failure(.JSONException))
                    return
                }
               
                completion (.success(result))
            }
            
        }
        
        task?.resume()
    }
    
}
