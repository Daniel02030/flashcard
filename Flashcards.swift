//
//  Flashcards.swift
//  Flashcard app
//
//  Created by iD Student on 7/5/17.
//  Copyright © 2017 com.idtech.daniel. All rights reserved.
//

import Foundation
import GameKit

// The question, option and answer class is created here (Flashcard)
class Flashcard {
    var question: String
    var options: [String]
    var correctAnswer: String
    
    init(question: String, options: [String]) {
        self.question = question
        self.options = options
        self.correctAnswer = options[0]
        
        self.options = shuffle(list: options)
    }
}

class CardCollection {
    public static var instance: CardCollection = CardCollection()
    
    public private(set) var cards: [Flashcard]
    
    public private(set) var currentIndex: Int
    
    public var currentCard: Flashcard{
        get {return cards[currentIndex]}
    }
    
    
    private init() {
        cards = [Flashcard(question: "What is the capital of Denmark",
                           options: ["Copenhagen", "Paris", "Sweden"]),
                Flashcard(question: "What isn't a Danish letter?",
                          options:["ö", "æ", "ø", "å"]),
                Flashcard(question: "Where is the city Odense?",
                          options:["Fyn", "Sjæland", "Jyland"]),
                Flashcard(question: "Which language does most Danish people not understand?",
                          options:["Finnish", "Sweedish", "Norwegian"]),
                Flashcard(question: "Where is the city Odense?",
                          options:["Fyn", "Sjæland", "Jyland"])]
        
        currentIndex = 0
        
        currentCard.options = shuffle(list: currentCard.options)
    }


    public func nextQuestion() {
        currentIndex += 1
        if currentIndex >= cards.count {
            currentIndex = 0
            cards = shuffle(list:cards)
        }
        currentCard.options = shuffle( list: currentCard.options)
    }
    
    func checkAnswer(selectedAnswer: Int) -> Bool {
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    }
    
    
    
}

func shuffle<T>(list: [T]) -> [T] {
    return GKRandomSource.sharedRandom().arrayByShufflingObjects(in: list) as! [T]
}
