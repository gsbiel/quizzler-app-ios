//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by user161760 on 1/1/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
