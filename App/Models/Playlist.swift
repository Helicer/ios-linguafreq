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

    func playRandom(lessons: [Lesson]) {

        // Choose a random lesson from lessons
        guard let firstLesson = lessons.randomElement() else { return }
        selectedLessonFrequencyRank = firstLesson.frequencyRank

        // Assign & Play random lesson
        audioplayer.lesson = firstLesson

        cancellable = audioplayer.$isDone.sink { isDone in
            if isDone {
                guard let nextLesson = lessons.randomElement() else { return }
                self.audioplayer.lesson = nextLesson
                self.selectedLessonFrequencyRank = nextLesson.frequencyRank
            }
        }

    }
}
