import AVFoundation

class AudioPlayer: NSObject, ObservableObject {
    @Published var isPlaying = false
    var lesson: Lesson? {
        didSet {
            pause()
            buildAudioQueue()
            play()
        }
    }

    private var player: AVQueuePlayer?

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

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

        player = AVQueuePlayer(items: [
            foreignPhrase,
            PlayerItem.silence, PlayerItem.silence,
            nativePhrase,
            PlayerItem.silence,
            foreignSentence,
            PlayerItem.silence, PlayerItem.silence,
            nativeSentence,
        ])

        NotificationCenter.default.removeObserver(self)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(audioPlayerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player?.items().last
        )
    }

    @objc private func audioPlayerDidFinishPlaying(notification: NSNotification) {
        isPlaying = false
    }
}
