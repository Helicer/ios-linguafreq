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
        
        let filepath = Bundle.main.path(forResource: "mandarin-lessons", ofType: "json")!

        let json = try! String(contentsOfFile: filepath)


        if let data = json.data(using: .utf8) {
            let decoder = JSONDecoder()
            let lessons = try! decoder.decode([Lesson].self, from: data)
            return lessons
                
        } else {
            return [] // Return empty lesson array
        }
        
        
    }
}
