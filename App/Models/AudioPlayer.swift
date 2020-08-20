import AVFoundation

class AudioPlayer: NSObject, ObservableObject {
    @Published var isPlaying = false
    var lesson: Lesson? {
        didSet {
            // stop() // Stop whatever was playing when new lesson is selected
            buildAudioQueue()
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

    private func buildAudioQueue() {
        guard let lesson = self.lesson else { return }

        let nativePhrase = PlayerItem(translationSet: lesson.phrase).native
        let nativeSentence = PlayerItem(translationSet: lesson.sentence).native
        let foreignPhrase = PlayerItem(translationSet: lesson.phrase).foreign
        let foreignSentence = PlayerItem(translationSet: lesson.sentence).foreign

        player = AVQueuePlayer(items: [nativePhrase, foreignPhrase, nativeSentence, foreignSentence])
    }
}

// BUG: Play/pause button does not go back to play when audio finishes
// TODO: Check into using NSNotificationCenter to detect when audio finishes and change buttont

extension AudioPlayer: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
    }
}
