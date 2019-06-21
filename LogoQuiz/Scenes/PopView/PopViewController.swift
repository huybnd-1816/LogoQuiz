//
//  PopViewController.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class PopViewController: UIViewController {
    @IBOutlet private weak var resultImageView: UIImageView!
    @IBOutlet private weak var resultLabel: UILabel!
    
    private var dataSource: SetOfQuestionsResponse?
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimate()
        setupData()
    }
    
    func setupData() {
        dataSource = APIService.shared.object
        guard let data = dataSource?.questions else { return }
        resultImageView.image = UIImage(named: data[index].imageFull!)
        resultLabel.text = data[index].subject
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Check that the touched view is your background view
        if touches.first?.view == self.view {
            removeAnimate()
        }
    }
}

extension PopViewController {
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParent: nil)
                self.view.removeFromSuperview()
                self.removeFromParent()
            }
        })
    }
}
