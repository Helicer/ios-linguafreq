import Foundation

struct Lesson: Decodable {
    struct TranslationSet: Decodable {
        let foreign: String
        let pronunciation: String?
        let native: String
    }
    
    
    //let id = UUID()
    let frequencyRank: Int
    let phrase: TranslationSet
    let sentence: TranslationSet
    
    let audioResource: String
    
    
}

