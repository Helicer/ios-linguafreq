import SwiftUI

struct LessonIndexView: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(lessons, id: \.id) { lesson in
                    NavigationLink(destination: LessonView(lesson: lesson)) {
                        HStack {
                            
                            Text(lesson.foreignPhrase)
                            Spacer()
                            Text(lesson.nativePhrase).foregroundColor(.gray)
                            
                        }
                    }
                    
                    
                }
            }.navigationBarTitle(Text("Lessons"))
        }
        
    }
}

struct LessonIndexView_Previews: PreviewProvider {
    static var previews: some View {
        LessonIndexView()
    }
}
