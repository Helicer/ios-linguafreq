import SwiftUI

struct LessonView: View {
    var lesson: Lesson
    let audioplayer = AudioPlayer()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                TranslationSetView(translationSet: lesson.phrase)
                Spacer().frame(height: 20)
                Star()
            }

            TranslationSetView(translationSet: lesson.sentence)

            Button(action: playAudio) {
                Text("Play audio")
            }

            Spacer()
        }
    }

    private func playAudio() {
        self.audioplayer.play(audioResource: self.lesson.audioResource)
    }
}

private struct Star: View {
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(.yellow)
            .frame(width: 30)
    }
}

private struct TranslationSetView: View {
    var translationSet: Lesson.TranslationSet

    var body: some View {
        VStack(alignment: .leading) {
            Text(translationSet.foreign)
                .font(.title)

            if translationSet.pronunciation != nil {
                Text(translationSet.pronunciation!).font(.title)
            }
            Text(translationSet.native).font(.title)
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: HardcodedJSONLessonRepository().allLessons[0])
            .padding()
    }
}
