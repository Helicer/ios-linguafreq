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
            .navigationBarItems(leading:
                                    HStack {
                                        Text("Play:")
                                        playlistButton;
                                        Text("|")
                                        randomPlaylistButton;

                                    },
                                trailing:
                                    HStack {
                                        filterButton
                                    }


            )
        }.sheet(isPresented: $isFilterSheetPresented) {
            FilterView(isPresented: self.$isFilterSheetPresented).environmentObject(self.lessonRepository)
        }
    }

    private var filterButton: some View {
        Button("Filter") {
            self.isFilterSheetPresented.toggle()
        }
    }

    private var playlistButton: some View {
        Button("All") {
            self.playlist.play(lessons: self.lessonRepository.lessons)
        }
    }

    private var randomPlaylistButton: some View {
        Button("Random") {
            self.playlist.playRandom(lessons: self.lessonRepository.lessons)
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
        @State var scroll_id = 0


        var body: some View {

                ScrollViewReader { scrollViewProxy in
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

                }.onChange(of: self.playlist.selectedLessonFrequencyRank) { id in
                    withAnimation{
                        scrollViewProxy.scrollTo(id, anchor: .bottom)
                    }
                }
            }
        }
    }

    private func playAudio(forLesson lesson: Lesson) {
        //    self.audioplayer.play(audioResource: lesson.audioResource)
    }


struct LessonIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LessonIndexView()
            .environmentObject(HardcodedJSONLessonRepository(preview: true))
    }
}

// TODO:
// State variable - which lesson is currently selected
// In the foreach, if lesson matches what is selected, expand/show details
// Button to toggle it
}
