import SwiftUI

struct FilterView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository

    var body: some View {
        Button("Show me 3") {
            self.lessonRepository.show3()
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
