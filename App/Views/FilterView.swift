import SwiftUI

struct FilterView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository
    @State private var startRange = 0
    @State private var endRange = 0

    var body: some View {
        VStack {
            Text("Select vocabulary frequency range:")

        HStack {
            Picker(selection: $startRange, label: Text("Start range")) {
                ForEach(0 ..< 500) {
                    Text("\($0)")
                }
            }.frame(maxWidth: 150)
            Text("to")
            Picker(selection: $endRange, label: Text("End range")) {
                ForEach(0 ..< 500) {
                    Text("00\($0)")
                }
            }.frame(maxWidth: 150)
        }
    }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
