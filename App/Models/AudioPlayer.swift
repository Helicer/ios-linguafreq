//
//  AudioPlayer.swift
//  LinguaFreq
//
//  Created by Jonathan Rogivue on 2020-07-07.
//  Copyright © 2020 JRO. All rights reserved.
//

import AVFoundation

class AudioPlayer: ObservableObject {
    @Published var isPlaying = false
    var lesson: Lesson? 

    private var player: AVAudioPlayer?
    
    func play() {
        guard let audioResource = lesson?.audioResource
            else { return }
        
        let optionalPath = Bundle.main.path(forResource: audioResource, ofType: "mp3", inDirectory: "Audio")
        let path = optionalPath!
        let url = URL(fileURLWithPath: path)
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()

        isPlaying = true
        
        
    }
}
