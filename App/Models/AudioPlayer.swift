import AVFoundation

class AudioPlayer: NSObject, ObservableObject {
    @Published var isPlaying = false
    var lesson: Lesson? {
        didSet {
            //stop() // Stop whatever was playing when new lesson is selected
            loadAudioResource()
        }
    }

    private var player: AVQueuePlayer?

    func play() {
        player?.play()
        isPlaying = true
    }

    func pause() {
        player?.pause()
        isPlaying = false
    }


    func loadAudioResource() {
        guard let lesson = self.lesson else { return }

        let playeritem1 = playerItem(audioResource: lesson.phrase.foreign.audioResource)
        let playeritem2 = playerItem(audioResource: lesson.phrase.native.audioResource)


        player = AVQueuePlayer(items: [playeritem1, playeritem2])

    }

    func playerItem(audioResource: String) -> AVPlayerItem {

        let optionalPath = Bundle.main.path(forResource: audioResource, ofType: "mp3", inDirectory: "Audio")
        let path = optionalPath!
        let url = URL(fileURLWithPath: path)

        return AVPlayerItem(url: url)
    }
}

// BUG: Play/pause button does not go back to play when audio finishes
// TODO: Check into using NSNotificationCenter to detect when audio finishes and change button


extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
    }
}
