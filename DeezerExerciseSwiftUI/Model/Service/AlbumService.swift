//
//  AlbumService.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 10/10/2022.
//

import Foundation

class AlbumService: AlbumRequester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    func get(url: URL, completion: @escaping (Result<AlbumDetail,ServiceError>) -> Void) {
        
        let request = URLRequest(url: url)
        
        task?.cancel()
        
        task = session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    print ("ERROR: \(String(describing: error?.localizedDescription))")
                    completion (.failure(.DataException("No Data, please check your Internet connection") ) )
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print ("ERROR: \(String(describing: response))")
                    completion (.failure(.QueryException("Bad server response, please try again") ) )
                    return
                }
                guard let result = try? JSONDecoder().decode(AlbumDetail.self, from: data) else {
                    print("JSON ERROR: \(String(describing: error?.localizedDescription))")
                    completion (.failure(.JSONException("An error occured, please try again") ) )
                    return
                }
              
                completion (.success(result))
            }
            
        }
        
        task?.resume()
    }
    
}
