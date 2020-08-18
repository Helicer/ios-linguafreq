import SwiftUI

struct LessonIndexView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    @State var selectedLessonFrequencyRank = -1
    @State var isFilterSheetPresented = false
    @ObservedObject var audioplayer = AudioPlayer()

    var body: some View {
        NavigationView {
            VStack {
                LessonList(
                    lessons: lessonRepository.lessons,
                    selectedLessonFrequencyRank: self.$selectedLessonFrequencyRank,
                    audioplayer: audioplayer
                )

                if self.selectedLessonFrequencyRank != -1 {
                    AudioToolbarView(
                        audioplayer: audioplayer
                    )
                }

            }.navigationBarTitle(Text("Lessons"))
                .navigationBarItems(trailing: filterButton)
        }.sheet(isPresented: $isFilterSheetPresented) {
            FilterView().environmentObject(self.lessonRepository)
        }
    }

    private var filterButton: some View {
        Button("Filter") {
            self.isFilterSheetPresented.toggle()
        }
    }

    private struct CollapsedLessonView: View {
        var lesson: Lesson

        var body: some View {
            HStack {
                Text(lesson.phrase.foreign.text).foregroundColor(Color.foreignAccent)
                Spacer()
                Text(lesson.phrase.native.text).foregroundColor(Color.nativeAccent)
            }
            .padding()
        }
    }

    private struct LessonList: View {
        var lessons: [Lesson]
        @Binding var selectedLessonFrequencyRank: Int
        @ObservedObject var audioplayer: AudioPlayer

        var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(lessons, id: \.frequencyRank) { lesson in

                        VStack(spacing: 0) {
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
                            Rectangle()
                                .foregroundColor(Color.gray)
                                .frame(height: 0.5)
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
        LessonIndexView(selectedLessonFrequencyRank: 1)
            .environmentObject(HardcodedJSONLessonRepository())
    }
}

// TODO:
// State variable - which lesson is currently selected
// In the foreach, if lesson matches what is selected, expand/show details
// Button to toggle it
