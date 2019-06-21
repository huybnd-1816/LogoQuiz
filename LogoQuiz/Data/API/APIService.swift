//
//  APIService.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

final class APIService {
    static let shared = APIService()
    
    var object: SetOfQuestionsResponse?
    
    private init() {
        readJSONFromFile(fileName: "example")
    }
    
    func readJSONFromFile(fileName: String) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                object = try JSONDecoder().decode(SetOfQuestionsResponse.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        return
    }
}
