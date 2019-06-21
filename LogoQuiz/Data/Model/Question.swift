//
//  SetOfQuestionsResponse.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/20/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

struct Question: Codable {
    let id: Int?
    let subject: String?
    let imageMissing: String?
    let imageFull: String?
    let result: [String]?
    
    enum CodingKeys: CodingKey {
        case id
        case subject
        case imageMissing
        case imageFull
        case result
    }
}
