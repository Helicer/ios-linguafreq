import SwiftUI

struct LessonView: View {
    var lesson: Lesson
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                TranslationSetView(translationSet: lesson.phrase)
                Spacer().frame(height: 20)
                Star()
            }

            TranslationSetView(translationSet: lesson.sentence)

            Spacer()
        }
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
        Group {
        LessonView(lesson: HardcodedJSONLessonRepository().allLessons[0])
            .padding()
// Show preview of View in fixed frame
//        LessonView(lesson: HardcodedJSONLessonRepository().allLessons[0])
//            .padding()
//            .previewLayout(.fixed(width: 500, height: 300))
        }
    }
}
