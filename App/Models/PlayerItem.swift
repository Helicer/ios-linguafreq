import AVFoundation

struct PlayerItem {
    let translationSet: Lesson.TranslationSet

    var native: AVPlayerItem {
        playerItem(audioResource: translationSet.native.audioResource)
    }

    var foreign: AVPlayerItem {
        playerItem(audioResource: translationSet.foreign.audioResource)
    }

    private func playerItem(audioResource: String) -> AVPlayerItem {
        let optionalPath = Bundle.main.path(forResource: audioResource, ofType: "mp3", inDirectory: "Audio")
        let path = optionalPath!
        let url = URL(fileURLWithPath: path)

        return AVPlayerItem(url: url)
    }
}
