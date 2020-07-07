import SwiftUI

struct LessonView: View {
    var lesson: Lesson
    
    var body: some View {
        VStack {
            Text(lesson.phrase.foreign).font(.title)
            if lesson.phrase.pronunciation != nil {
                Text(lesson.phrase.pronunciation!).font(.title)
            }
        
            Text(lesson.phrase.native).font(.title)
            Text(lesson.sentence.foreign)
            Text(lesson.sentence.native)
            Spacer()
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: lessons[1])
    }
}

