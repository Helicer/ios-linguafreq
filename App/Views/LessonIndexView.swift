import SwiftUI

struct LessonIndexView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    @State var isFilterSheetPresented = false
    @ObservedObject var playlist = Playlist()

    var body: some View {
        NavigationView {
            VStack {
                LessonList(
                    lessons: lessonRepository.lessons,
                    playlist: playlist
                )

                if playlist.selectedLessonFrequencyRank != -1 {
                    AudioToolbarView(
                        audioplayer: playlist.audioplayer
                    )
                }

            }.navigationBarTitle(Text("Lesson Playlist"))
                .navigationBarItems(leading: playlistButton, trailing: filterButton)
        }.sheet(isPresented: $isFilterSheetPresented) {
            FilterView().environmentObject(self.lessonRepository)
        }
    }

    private var filterButton: some View {
        Button("Filter") {
            self.isFilterSheetPresented.toggle()
        }
    }

    private var playlistButton: some View {
        Button("Play all") {
            self.playlist.play(lessons: self.lessonRepository.lessons)
        }
    }

    private struct CollapsedLessonView: View {
        var lesson: Lesson

        var body: some View {
            HStack {
                Text("#" + String(lesson.frequencyRank))
                    .foregroundColor(Color.textSecondary)
                Text(lesson.phrase.foreign.text).foregroundColor(Color.foreignAccent)
                Spacer()
                Text(lesson.phrase.native.text).foregroundColor(Color.nativeAccent)
            }
            .padding()
        }
    }

    private struct LessonList: View {
        var lessons: [Lesson]
        @ObservedObject var playlist: Playlist


        var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(lessons, id: \.frequencyRank) { lesson in

                        VStack(spacing: 0) {
                            Button(action: {
                                self.playlist.selectedLessonFrequencyRank = lesson.frequencyRank
                                self.playlist.play(lessons: [lesson])
                            }) {
                                Group {
                                    if lesson.frequencyRank == self.playlist.selectedLessonFrequencyRank {
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
        LessonIndexView()
            .environmentObject(HardcodedJSONLessonRepository())
    }
}

// TODO:
// State variable - which lesson is currently selected
// In the foreach, if lesson matches what is selected, expand/show details
// Button to toggle it
