//
//  SetOfQuestionsResponse.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

struct SetOfQuestionsResponse: Codable {
    let level: String?
    let numberOfQuestions: Int?
    let category: String?
    let questions: [Question]?
    
    enum CodingKeys: CodingKey {
        case level
        case numberOfQuestions
        case category
        case questions
    }
}

