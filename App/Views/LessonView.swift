import SwiftUI

struct LessonView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    var lessonID: UUID

    let audioplayer = AudioPlayer()
    
    var body: some View {
        VStack {
            Text(lesson.phrase.foreign).font(.title)
            if lesson.phrase.pronunciation != nil {
                Text(lesson.phrase.pronunciation!).font(.title)
            }
        
            Text(lesson.phrase.native).font(.title)
            Text(lesson.sentence.foreign)
            Text(lesson.sentence.native)
            Button(action: {
                self.audioplayer.play(audioResource: self.lesson.audioResource)
            }) {
                Text("Play audio")
            }
            Spacer()
        }
    }

    // computed property
    private var lesson: Lesson { lessonRepository.allLessons.first(where: { $0.id == lessonID })! }
}

//struct LessonView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        LessonView(lesson: HardcodedJSONLessonRepository().allLessons[0])
//    }
//}
//
