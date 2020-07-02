//
//  Lesson.swift
//  HelloWorld
//
//  Created by Jonathan Rogivue on 2020-07-02.
//  Copyright © 2020 JRO. All rights reserved.
//

import Foundation

struct Lesson {
    let id = UUID()
    let frequencyRank: Int
    let foreignPhrase: String
    let nativePhrase: String
    let foreignSentence: String
    let nativeSentence: String
}

let lessons = [
    Lesson(
        frequencyRank: 59,
        foreignPhrase: "cómo",
        nativePhrase: "how",
        foreignSentence: "¿Cómo está todo?",
        nativeSentence: "How is everything?"
    ),
    Lesson(
        frequencyRank: 60,
        foreignPhrase: "quiero",
        nativePhrase: "I want",
        foreignSentence: "Quiero que estés aquí.",
        nativeSentence: "I want you to be here."
    ),
    Lesson(
        frequencyRank: 61,
        foreignPhrase: "sólo",
        nativePhrase: "just, alone",
        foreignSentence: "Sólo quiero esto.",
        nativeSentence: "I just want this."
    ),
    Lesson(
        frequencyRank: 62,
        foreignPhrase: "soy",
        nativePhrase: "I am",
        foreignSentence: "Yo soy muy alto.",
        nativeSentence: "I am very tall."
    )
    





]
