import SwiftUI

struct LessonView: View {
    var lesson: Lesson

    var body: some View {
        VStack {
            TranslationSetView(translationSet: lesson.phrase)
                .padding(.bottom)
            TranslationSetView(translationSet: lesson.sentence)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.lightBackground)
    }
}

private struct TranslationSetView: View {
    var translationSet: Lesson.TranslationSet

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(translationSet.foreign)
                    .font(.title)
                    .foregroundColor(Color.foreignAccent)
                if translationSet.pronunciation != nil {
                    Text(translationSet.pronunciation!)
                        .font(.title)
                        .foregroundColor(Color.textPrimary)
                }
                Text(translationSet.native)
                    .foregroundColor(Color.nativeAccent)
            }
            .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: HardcodedJSONLessonRepository().lessons[0])
        // Show preview of View in fixed frame
        //        LessonView(lesson: HardcodedJSONLessonRepository().allLessons[0])
        //            .padding()
        //            .previewLayout(.fixed(width: 500, height: 300))
    }
}
