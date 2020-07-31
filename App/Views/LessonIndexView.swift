import SwiftUI

struct LessonIndexView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    @State var selectedLessonFrequencyRank = -1

    var body: some View {
        NavigationView {
            VStack {
                LessonList(
                    lessons: lessonRepository.allLessons,
                    selectedLessonFrequencyRank: self.$selectedLessonFrequencyRank
                )

                if self.selectedLessonFrequencyRank != -1 {
                    AudioToolbarView()
                }

            }
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

        var body: some View {
            List {
                  ForEach(lessons, id: \.id) { lesson in
                      Button(action: {
                          self.selectedLessonFrequencyRank = lesson.frequencyRank
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
              }.navigationBarTitle(Text("Lessons"))

        }


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
