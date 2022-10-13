//
//  PlayerViewModel.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 12/10/2022.
//

import Foundation

import AVFoundation


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
    
    @objc func audioPlayerDidFinishPlaying(sender: Notification) {
        state = .idle
    }
    
    
    // DOWNOLOAD MP3 FILE
    func start (_ string: String) {
        
        state = .loading
        
        apiRequester.getAudioFile(url: URL(string: string)! ){ result in

            switch result{
                
            case .success(let url) :
                self.state = .playing
                self.play (url: url)

            case .failure(let error) :
                self.state = .failed(error)
                
            }
         
        }
        
    }
    
    // PLAYER STOP
    func stop () {
        state = .idle
        player?.pause()
    }
    
    // PLAYER START
    private func play (url:URL) {
        
        let item = AVPlayerItem(url: url)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.audioPlayerDidFinishPlaying(sender:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: item)
        
        player = AVPlayer(playerItem: item)
            
        player!.play()
        
        state = .playing
    
    }
    
    
}
