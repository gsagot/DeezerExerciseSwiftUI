//
//  ApiRequester.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 08/10/2022.
//

import Foundation

class ApiRequester: Requester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDataTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    func searchArtist(url: URL, completion: @escaping (Bool, Artists?) -> ()) {
        
        let request = URLRequest(url: url)
        
        task?.cancel()
        
        task = session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                    print ("ERROR: \(String(describing: error?.localizedDescription))")
                    completion (false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print ("ERROR: \(String(describing: response))")
                    completion (false, nil)
                    return
                }
                guard let result = try? JSONDecoder().decode(Artists.self, from: data) else {
                    print("JSON ERROR: \(String(describing: error?.localizedDescription))")
                    completion (false, nil)
                    return
                }
                
                completion (true, result)
            }
            
        }
        
        task?.resume()
    }
    
}
