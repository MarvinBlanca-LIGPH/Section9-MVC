//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Mark Marvin Blanca on 3/4/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var question: String
    var answers: [String]
    var rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answers = a
        rightAnswer = correctAnswer
    }
}
