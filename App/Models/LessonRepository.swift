//
//  LessonRepository.swift
//  LinguaFreq
//
//  Created by Jonathan Rogivue on 2020-07-22.
//  Copyright © 2020 JRO. All rights reserved.
//

import Foundation

struct LessonRepository {
    
    func loadData() -> [Lesson] {
        
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


//Lesson(
//    frequencyRank: 1,
//    phrase: Lesson.TranslationSet(
//        foreign: "爱",
//        pronunciation: "ài",
//        native: "to love"),
//    sentence: Lesson.TranslationSet(
//        foreign: "我爱深圳。",
//        pronunciation: "Wǒ ài Shēnzhèn.",
//        native: "f"),
//    audioResource: "lesson-1"
//),
