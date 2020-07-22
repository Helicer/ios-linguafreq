import SwiftUI

struct LessonIndexView: View {
    var lessonRepository: LessonRepository
    
    var body: some View {
        NavigationView {
            List {
                ForEach(lessonRepository.allLessons, id: \.id) { lesson in
                    NavigationLink(destination: LessonView(lesson: lesson)) {
                        HStack {
                            Text(lesson.phrase.foreign)
                            Spacer()
                            Text(lesson.phrase.native).foregroundColor(.gray)
                        }
                    }
                }
            }.navigationBarTitle(Text("Lessons"))
        }
    }
}

struct LessonIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LessonIndexView(lessonRepository: HardcodedJSONLessonRepository())
    }
}