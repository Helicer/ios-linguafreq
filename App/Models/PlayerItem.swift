import AVFoundation

struct PlayerItem {
    let translationSet: Lesson.TranslationSet

    var native: AVPlayerItem {
        Self.playerItem(audioResource: translationSet.native.audioResource)
    }

    var foreign: AVPlayerItem {
        Self.playerItem(audioResource: translationSet.foreign.audioResource)
    }

    static var silence: AVPlayerItem {
        playerItem(audioResource: "silence_1.0s")
    }

    private static func playerItem(audioResource: String) -> AVPlayerItem {
        let optionalPath = Bundle.main.path(forResource: audioResource, ofType: "mp3", inDirectory: "Audio")
        let path = optionalPath!
        let url = URL(fileURLWithPath: path)

        return AVPlayerItem(url: url)
    }
}
