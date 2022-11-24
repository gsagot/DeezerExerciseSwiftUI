//
//  Mp3Service.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation

class PreviewService : Requester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDownloadTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    // Get mp3 file
    
    func search<T:Codable> (url: URL, completion : @escaping (Result<T,ServiceError>) -> Void ) {
        
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(url.lastPathComponent)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        task = session.downloadTask(with: request) { (location, response, error) in
            
            DispatchQueue.main.async {
                
                // No data
                guard let location = location, error == nil else {
                    completion(.failure(.DataException("No Data, please check your Internet connection") ) )
                    return
                }
                
                // Bad response server
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.QueryException("Bad server response, please try again") ) )
                    return
                }
                
                // Move file to application bundle
                do {
                    try FileManager.default.moveItem(at: location, to: destinationUrl)
                } catch {
                    print("File already exists")
                }
                completion(.success(destinationUrl as! T))
            }
        }
        task?.resume()
    }
    
}

