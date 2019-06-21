//
//  QuestionCell.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

enum BaseResult {
    case correct
    case incorrect
}

class QuestionCell: UICollectionViewCell {
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var questionImageView: UIImageView!
    @IBOutlet private weak var answerButton1: UIButton!
    @IBOutlet private weak var answerButton2: UIButton!
    @IBOutlet private weak var answerButton3: UIButton!
    @IBOutlet private weak var answerButton4: UIButton!
    
    private var dataCell: Question!
    var didSelect: ((BaseResult, Int) -> Void)?

    func configCell(_ data: Question, index: Int){
        guard let image = data.imageMissing,
            let result = data.result else { return }

        dataCell = data
        questionLabel.text = "Question " + String(index + 1)
        questionImageView.image = UIImage(named: image)
        answerButton1.setTitle(result[0], for: .normal)
        answerButton2.setTitle(result[1], for: .normal)
        answerButton3.setTitle(result[2], for: .normal)
        answerButton4.setTitle(result[3], for: .normal)
    }
    
    @IBAction func handleAnswerButtonTapped(_ sender: UIButton) {
        switch sender {
        case answerButton1, answerButton2, answerButton3 ,answerButton4:
            guard let answer = sender.titleLabel?.text,
                let index = dataCell.id else { return }
            if answer == dataCell.subject {
                didSelect?(.correct, index)
            } else {
                didSelect?(.incorrect, index)
            }
            break
        default:
            break
        }
    }
}
