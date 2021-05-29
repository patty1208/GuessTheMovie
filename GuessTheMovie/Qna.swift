//
//  Qna.swift
//  GuessTheMovie
//
//  Created by 林佩柔 on 2021/5/27.
//

import Foundation

struct Questions: Codable {
    let question: String
    let choice1: String
    let choice2: String
    let choice3: String
    let choice4: String
    let answer: String
    let score: Int
}

