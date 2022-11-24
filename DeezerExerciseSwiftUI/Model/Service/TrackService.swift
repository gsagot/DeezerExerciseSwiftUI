//
//  File.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 09/10/2022.
//

import Foundation


class TrackService: Requester {
    

    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    // Get Artist top tracklist
    
    func search<T:Codable>(url: URL, completion: @escaping (Result<T,ServiceError>) -> Void) {
        
        let request = URLRequest(url: url)
        
        task?.cancel()
        
        task = session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                // No data
                guard let data = data, error == nil else {
                    print ("ERROR: \(String(describing: error?.localizedDescription))")
                    completion (.failure(.DataException("No Data, please check your Internet connection") ) )
                    return
                }
                
                // Bad response server
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print ("ERROR: \(String(describing: response))")
                    completion (.failure(.QueryException("Bad server response, please try again") ) )
                    return
                }
                
                // Json error
                guard let result = try? JSONDecoder().decode(T.self, from: data) else {
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
