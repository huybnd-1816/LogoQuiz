//
//  ResultCell.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class ResultCell: UITableViewCell {
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var resultLabel: UILabel!

    func configCell(result: Result) {
        questionLabel.text = "Question " + String(result.id)
        resultLabel.text = String(result.isCorrect)
    }
}
