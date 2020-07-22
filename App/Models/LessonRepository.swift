//
//  LessonRepository.swift
//  LinguaFreq
//
//  Created by Jonathan Rogivue on 2020-07-22.
//  Copyright © 2020 JRO. All rights reserved.
//

import Foundation

protocol LessonRepository {
    var allLessons: [Lesson] { get } // Implementation must have a getter to conform to protocol
    
}

struct HardcodedJSONLessonRepository: LessonRepository {
    
    let allLessons: [Lesson]
    
    init() {
        self.allLessons = HardcodedJSONLessonRepository.loadData()
    }
    
    private static func loadData() -> [Lesson] {
        
        let json =
        """
        [
            {
                "frequencyRank": 1,
                "phrase": {
                    "foreign": "爱",
                    "pronunciation": "ài",
                    "native": "to love"
                },
                "sentence": {
                    "foreign": "我爱深圳。",
                    "pronunciation": "Wǒ ài Shēnzhèn.",
                    "native": "I love Shenzhen."
                },
                "audioResource": "lesson-1"
            }
        ]
        """

        if let data = json.data(using: .utf8) {
            let decoder = JSONDecoder()
            let lessons = try! decoder.decode([Lesson].self, from: data)
            return lessons
                
        } else {
            return [] // Return empty lesson array
        }
        
        
    }
}