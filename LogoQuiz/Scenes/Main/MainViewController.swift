//
//  ViewController.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/20/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Logo Quiz"
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    @IBAction func handlePlayButtonTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
