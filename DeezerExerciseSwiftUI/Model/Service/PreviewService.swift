//
//  Mp3Service.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation

class PreviewService : PreviewRequester {
    
    private var session = URLSession(configuration: .default)
    
    private var task: URLSessionDownloadTask?
    
    init(session: URLSession) {
        self.session = session
    }
    
    init(){
        
    }
    
    func getAudioFile (url: URL, completion : @escaping (Result<URL,ServiceError>) -> Void ) {
        
        let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsDirectoryURL.appendingPathComponent(url.lastPathComponent)
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        task = session.downloadTask(with: request) { (location, response, error) in
            
            DispatchQueue.main.async {
                guard let location = location, error == nil else {
                    completion(.failure(.DataException("No Data, please check your Internet connection") ) )
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.QueryException("Bad server response, please try again") ) )
                    return
                }
                do {
                    try FileManager.default.moveItem(at: location, to: destinationUrl)
                } catch {
                    print("File already exists")
                }
                completion(.success(destinationUrl))
            }
        }
        task?.resume()
    }
    
}

