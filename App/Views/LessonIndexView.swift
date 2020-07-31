import SwiftUI

struct LessonIndexView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    @State var selectedLessonFrequencyRank = -1
    @ObservedObject var audioplayer = AudioPlayer()

    var body: some View {
        NavigationView {
            VStack {
                LessonList(
                    lessons: lessonRepository.allLessons,
                    selectedLessonFrequencyRank: self.$selectedLessonFrequencyRank,
                    audioplayer: audioplayer
                )

                if self.selectedLessonFrequencyRank != -1 {
                    AudioToolbarView(
                    audioplayer: audioplayer
                    )
                }

            }.navigationBarTitle(Text("Lessons"))
        }
    }

    private struct CollapsedLessonView: View {
        var lesson: Lesson

        var body: some View {
            HStack {
                Text(lesson.phrase.foreign)
                Spacer()
                Text(lesson.phrase.native).foregroundColor(.gray)
            }
        }
    }



    private struct LessonList: View {
        var lessons: [Lesson]
        @Binding var selectedLessonFrequencyRank: Int
        @ObservedObject var audioplayer: AudioPlayer

        var body: some View {
            List {
                ForEach(lessons, id: \.id) { lesson in
                    Button(action: {
                        self.selectedLessonFrequencyRank = lesson.frequencyRank
                        self.audioplayer.lesson = lesson
                    }) {
                        Group {
                            if lesson.frequencyRank == self.selectedLessonFrequencyRank {
                                LessonView(lesson: lesson)
                            } else {
                                CollapsedLessonView(lesson: lesson)

                              }
                          }
                      }
                  }
              }
        }
    }

    private func playAudio(forLesson lesson: Lesson) {
    //    self.audioplayer.play(audioResource: lesson.audioResource)
    }


}


struct LessonIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LessonIndexView(selectedLessonFrequencyRank: 2)
            .environmentObject(HardcodedJSONLessonRepository())
    }
}






// TODO:
// State variable - which lesson is currently selected
// In the foreach, if lesson matches what is selected, expand/show details
// Button to toggle it
