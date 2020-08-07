import Foundation

class HardcodedJSONLessonRepository: ObservableObject {
    @Published var lessons = [Lesson]()
    var startRange = 0 {
        didSet {
            filter()
        }
    }
    var endRange = 20 {
        didSet {
            filter()
        }
    }
    private var allLessons = [Lesson]()
    
    init() {
        self.allLessons = loadData()
        self.lessons = self.allLessons
    }

    func showAll() {
        self.lessons = self.allLessons
    }

    private func filter() {
        lessons = allLessons.filter({ lesson -> Bool in
            lesson.frequencyRank >= startRange && lesson.frequencyRank <= endRange
        })
    }

    
    private func loadData() -> [Lesson] {
        // Crashes if file does not exist
        let file = Bundle.main.url(forResource: "mandarin-lessons", withExtension:  "json")!

        // Reading data from file, forcing it to be Data (if doesn't exist, will cause a hard error)
        let data = try! Data(contentsOf: file)
        let decoder = JSONDecoder()

        // Crash if can't decode (e.g. malformed JSON, missing/invalid key, doesn't match struct properly)
        let lessons = try! decoder.decode([Lesson].self, from: data)
        return lessons
    }
}
