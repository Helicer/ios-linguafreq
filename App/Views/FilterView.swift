import SwiftUI

struct FilterView: View {
    @EnvironmentObject var lessonRepository: HardcodedJSONLessonRepository

    var body: some View {
        VStack {
            Text("Select vocabulary frequency range:")
            Button("Show All") {
                self.lessonRepository.showAll()
            }

            // TODO: Start picker at least frequency value
            HStack {
                Picker(selection: $lessonRepository.startRange, label: Text("Start range")) {
                    ForEach(0 ..< lessonRepository.maxFrequencyRank + 1) {
                        Text("\($0)")
                    }
                }.frame(maxWidth: 150)
                Text("to")
                Picker(selection: $lessonRepository.endRange, label: Text("End range")) {
                    ForEach(0 ..< lessonRepository.maxFrequencyRank + 1) {
                        Text("\($0)")
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
