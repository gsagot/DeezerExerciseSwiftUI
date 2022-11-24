//
//  PlayerViewModel.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation

import AVFoundation

/**
 A class to manage audio file from ** http://api.deezer.com **.
 */

class AudioPlayer: ObservableObject {
    
    static var shared = AudioPlayer()
    
    enum State {
        case idle
        case loading
        case failed(Error)
        case playing
    }
    
    private var player:AVPlayer?
    
    private let apiRequester = PreviewService()
    
    @Published private(set) var state = State.idle
    
    private init () {
        
        // Prevent device is not on silent and set audio sessions category to .playback
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    // When audio player finished playing
    @objc func audioPlayerDidFinishPlaying(sender: Notification) {
        state = .idle
    }
    
    /**
     Call this function to get audio file  from  ** http://api.deezer.com **.
     This function needs *preview* **URL** value.
     This function updates  **state** class property.
     */
    
    func start (_ string: String) {
        
        state = .loading
        
        apiRequester.search(url: URL(string: string)! ){ (result: Result<URL,ServiceError>) in

            switch result{
                
            case .success(let url) :
                self.state = .playing
                self.play (url: url)

            case .failure(let error) :
                self.state = .failed(error)
                
            }
         
        }
        
    }
    
    /**
     Call this function to stop current audio player.
     */
    func stop () {
        state = .idle
        player?.pause()
    }
    
    // play the downladed mp3 file
    private func play (url:URL) {
        
        let item = AVPlayerItem(url: url)
        
        // Need To know when audio player finished playing
        NotificationCenter.default.addObserver(self, selector: #selector(self.audioPlayerDidFinishPlaying(sender:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: item)
        
        player = AVPlayer(playerItem: item)
            
        player!.play()
        
        state = .playing
    
    }
    
    
}
