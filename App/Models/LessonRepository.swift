//
//  LessonRepository.swift
//  LinguaFreq
//
//  Created by Jonathan Rogivue on 2020-07-22.
//  Copyright © 2020 JRO. All rights reserved.
//

import Foundation

protocol LessonRepository: ObservableObject {
    var lessons: [Lesson] { get } // Implementation must have a getter to conform to protocol
}

class HardcodedJSONLessonRepository: ObservableObject, LessonRepository {
    @Published var lessons = [Lesson]()
    private var allLessons = [Lesson]()
    
    init() {
        self.allLessons = loadData()
        self.lessons = self.allLessons
    }

    func show3() {
        lessons = lessons.filter({ lesson -> Bool in
            lesson.frequencyRank < 101
        })
    }

    func showAll() {
        self.lessons = self.allLessons
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
