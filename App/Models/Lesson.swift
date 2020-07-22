import Foundation

struct Lesson: Decodable {
    struct TranslationSet: Decodable {
        let foreign: String
        let pronunciation: String?
        let native: String
    }
    
    
    let id = UUID()
    let frequencyRank: Int
    let phrase: TranslationSet
    let sentence: TranslationSet
    
    let audioResource: String
    
    
}




let lessons = [
    //    Lesson(
    //        frequencyRank: 59,
    //        foreignPhrase: "cómo",
    //        nativePhrase: "how",
    //        foreignSentence: "¿Cómo está todo?",
    //        nativeSentence: "How is everything?"
    //    ),
    //    Lesson(
    //        frequencyRank: 60,
    //        foreignPhrase: "quiero",
    //        nativePhrase: "I want",
    //        foreignSentence: "Quiero que estés aquí.",
    //        nativeSentence: "I want you to be here."
    //    ),
    //    Lesson(
    //        frequencyRank: 61,
    //        foreignPhrase: "sólo",
    //        nativePhrase: "just, alone",
    //        foreignSentence: "Sólo quiero esto.",
    //        nativeSentence: "I just want this."
    //    ),
    //    Lesson(
    //        frequencyRank: 62,
    //        foreignPhrase: "soy",
    //        nativePhrase: "I am",
    //        foreignSentence: "Yo soy muy alto.",
    //        nativeSentence: "I am very tall."
    //    ),
    
    //    Lesson(
    //        frequencyRank: 1,
    //        foreignPhrase: "爱",
    //        foreignPhrasePronunciation: "ài",
    //        nativePhrase: "to love",
    //        foreignSentence: "我爱深圳。",
    //        foreignSentencePronunciation: "Wǒ ài Shēnzhèn.",
    //        nativeSentence: "I love Shenzhen."
    //    )
    //
    
    Lesson(
        frequencyRank: 1,
        phrase: Lesson.TranslationSet(
            foreign: "爱",
            pronunciation: "ài",
            native: "to love"),
        sentence: Lesson.TranslationSet(
            foreign: "我爱深圳。",
            pronunciation: "Wǒ ài Shēnzhèn.",
            native: "I love Shenzhen."),
        audioResource: "lesson-1"
    ),
    
        Lesson(
            frequencyRank: 59,
            phrase: Lesson.TranslationSet(
                foreign: "cómo",
                pronunciation: nil,
                native: "how"),
            sentence: Lesson.TranslationSet(
                foreign: "¿Cómo está todo?",
                pronunciation: nil,
                native: "How is everything?"),
            audioResource: "lesson-59"
        ),
    
    
]
