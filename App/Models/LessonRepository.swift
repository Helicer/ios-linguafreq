//
//  LessonRepository.swift
//  LinguaFreq
//
//  Created by Jonathan Rogivue on 2020-07-22.
//  Copyright © 2020 JRO. All rights reserved.
//

import Foundation

protocol LessonRepository: ObservableObject {
    var allLessons: [Lesson] { get } // Implementation must have a getter to conform to protocol
    
}

class HardcodedJSONLessonRepository: ObservableObject, LessonRepository {
    @Published var allLessons = [Lesson]()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allLessons = HardcodedJSONLessonRepository.loadData()
        }
    }
    
    private static func loadData() -> [Lesson] {
        
        let file = Bundle.main.url(forResource: "mandarin-lessons", withExtension:  "json")!


        if let data = try? Data(contentsOf: file) {
            let decoder = JSONDecoder()
            let lessons = try! decoder.decode([Lesson].self, from: data)
            return lessons
                
        } else {
            return [] // Return empty lesson array
        }
        
        
    }
}
