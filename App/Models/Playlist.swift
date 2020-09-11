import Combine
import SwiftUI

class Playlist: ObservableObject {
    @ObservedObject var audioplayer = AudioPlayer()
    @Published var selectedLessonFrequencyRank = -1

    private var cancellable: AnyCancellable?

    func play(lessons: [Lesson]) {
        guard let firstLesson = lessons.first else { return }
        audioplayer.lesson = firstLesson
        selectedLessonFrequencyRank = firstLesson.frequencyRank

        var lessonIndex = 0
        cancellable = audioplayer.$isDone.sink { isDone in
            if isDone {
                lessonIndex += 1

                if lessonIndex < lessons.count {
                    let nextLesson = lessons[lessonIndex]
                    self.audioplayer.lesson = nextLesson
                    self.selectedLessonFrequencyRank = nextLesson.frequencyRank
                }
            }
        }
    }
}
