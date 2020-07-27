import SwiftUI

struct LessonIndexView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    @State var selectedLessonFrequencyRank = -1

    var body: some View {
        NavigationView {
            List {
                ForEach(lessonRepository.allLessons, id: \.id) { lesson in
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





}


struct LessonIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LessonIndexView()
            .environmentObject(HardcodedJSONLessonRepository())
    }
}






// TODO:
// State variable - which lesson is currently selected
// In the foreach, if lesson matches what is selected, expand/show details
// Button to toggle it
