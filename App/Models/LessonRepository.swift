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

// https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
func errorHandling() {
    let lingua = Lingua()

    // do, try, catch
    do {
        let doTryCatch = try lingua.doSomething()
        print(doTryCatch)
    } catch LinguaError.somethingBad {
        print("Something bad happened.")
    } catch LinguaError.somethingVeryBad {
        print("Something very bad happened.")
    } catch LinguaError.notEnough(let neededValue) {
        print("We needed \(neededValue)")
    } catch {
        print("Something unknown happened.", error)
    }

    // try?
    if let optionalTry = try? lingua.doSomething() {
        print(optionalTry)
    } else {
        print("Some error happened.")
    }

    // try!
    let forceTry = try! lingua.doSomething()
    print(forceTry)
}

// Not my problem! Handle it somewhere else (the caller).
func throwableErrorHandling() throws {
    print(try Lingua().doSomething())
}

enum LinguaError: Error {
    case somethingBad
    case somethingVeryBad
    case notEnough(neededValue: Int)
}

struct Lingua {
    func doSomething(shouldThrow: Bool = false) throws -> String {
        if shouldThrow {
            throw LinguaError.notEnough(neededValue: 10)
        } else {
            return "It worked!"
        }
    }
}
