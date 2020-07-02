import SwiftUI

struct LessonView: View {
    var lesson: Lesson
    
    var body: some View {
        VStack {
            Text(lesson.foreignPhrase).font(.title)
            Text(lesson.nativePhrase).font(.title)
            Text(lesson.foreignSentence)
            Text(lesson.nativeSentence)
            Spacer()
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: lessons[1])
    }
}
