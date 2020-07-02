import SwiftUI

struct LessonIndexView: View {
    
    var body: some View {
        List {
            ForEach(lessons, id: \.id) { lesson in
                HStack {
                    Text(lesson.foreignPhrase)
                    Spacer()
                    Text(lesson.nativePhrase).foregroundColor(.gray)
                }
                
            }
        }
    }
}

struct LessonIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LessonIndexView()
    }
}
