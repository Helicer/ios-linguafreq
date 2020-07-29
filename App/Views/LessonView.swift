import SwiftUI

struct LessonView: View {
    var lesson: Lesson

    let audioplayer = AudioPlayer()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    // Text("This is our giant string which will take up tons of space.")
                    Text(lesson.phrase.foreign)
                        .font(.title)

                    if lesson.phrase.pronunciation != nil {
                        Text(lesson.phrase.pronunciation!).font(.title)
                    }
                    Text(lesson.phrase.native).font(.title)
                }
                Spacer().frame(height: 20)
                Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
                .frame(width: 30)
            }
            Text(lesson.sentence.foreign)
            Text(lesson.sentence.native)
            Button(action: {
                self.audioplayer.play(audioResource: self.lesson.audioResource)
            }) {
                Text("Play audio")
            }
            Spacer()
        }
        //        .frame(maxWidth: .infinity, alignment: .leading)  // Create enough space, and then left-align the contents
        //                Sp
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {

        LessonView(lesson: HardcodedJSONLessonRepository().allLessons[0])
            .padding()
    }
}

