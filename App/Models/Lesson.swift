import Foundation

struct Lesson: Decodable {
    struct TranslationSet: Decodable {
        let foreign: Translation
        let pronunciation: Translation?
        let native: Translation
    }

    struct Translation: Decodable {
        let text: String
        let audioResource: String
    }

    let frequencyRank: Int
    let phrase: TranslationSet
    let sentence: TranslationSet
}
