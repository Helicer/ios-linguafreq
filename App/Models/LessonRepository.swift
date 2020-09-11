import Foundation

class HardcodedJSONLessonRepository: ObservableObject {
    @Published var lessons = [Lesson]()
    var startRange = 0 {
        didSet {
            filter()
        }
    }

    var endRange = 0 {
        didSet {
            filter()
        }
    }

    var maxFrequencyRank = 0

    private var allLessons = [Lesson]()

    init(preview: Bool = false) {
        self.allLessons = loadData()

        if preview {
            self.allLessons = Array(allLessons[0...4])
        }

        self.lessons = allLessons

        self.startRange = lessons.min { lesson1, lesson2 -> Bool in
            lesson1.frequencyRank < lesson2.frequencyRank
        }?.frequencyRank ?? 0

        self.endRange = lessons.max { lesson1, lesson2 -> Bool in
            lesson1.frequencyRank < lesson2.frequencyRank
        }?.frequencyRank ?? 0

        self.maxFrequencyRank = endRange
    }

    func showAll() {
        lessons = allLessons
    }

    private func filter() {
        lessons = allLessons.filter { lesson -> Bool in
            lesson.frequencyRank >= startRange && lesson.frequencyRank <= endRange
        }
    }

    private func loadData() -> [Lesson] {
        // Crashes if file does not exist
        let file = Bundle.main.url(forResource: "es-lessons", withExtension: "json")!

        // Reading data from file, forcing it to be Data (if doesn't exist, will cause a hard error)
        let data = try! Data(contentsOf: file)
        let decoder = JSONDecoder()

        // Crash if can't decode (e.g. malformed JSON, missing/invalid key, doesn't match struct properly)
        let lessons = try! decoder.decode([Lesson].self, from: data)
        return lessons
    }
}
