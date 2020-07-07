//
//  AudioPlayer.swift
//  LinguaFreq
//
//  Created by Jonathan Rogivue on 2020-07-07.
//  Copyright © 2020 JRO. All rights reserved.
//

import AVFoundation

class AudioPlayer {
    var player: AVAudioPlayer?
    
    func play() {
        
        let path = Bundle.main.path(forResource: "lesson-59", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        print(url)
        
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
        
        
    }
}
