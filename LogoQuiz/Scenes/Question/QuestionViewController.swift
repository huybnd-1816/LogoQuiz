//
//  QuestionViewController.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class QuestionViewController: UIViewController {
    @IBOutlet private weak var questionCollectionView: UICollectionView!
    
    private var dataSource: SetOfQuestionsResponse? {
        didSet {
            questionCollectionView.reloadData()
        }
    }
    
    private var answers = [Int: Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        navigationItem.title = "Logo Quiz"
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        questionCollectionView.register(UINib.init(nibName: "QuestionCell", bundle: nil), forCellWithReuseIdentifier: "QuestionCell")
        dataSource = APIService.shared.object
    }
}

extension QuestionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.numberOfQuestions ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = questionCollectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        guard let data = dataSource?.questions else { return UICollectionViewCell() }
        cell.configCell(data[indexPath.row], index: indexPath.row)
        cell.didSelect = { [weak self] (result, index) in
            guard let self = self else { return }
            switch result {
            case .correct:
                self.answers.updateValue(true, forKey: index)
            case .incorrect:
                self.answers.updateValue(false, forKey: index)
            }
            
            guard indexPath.row < data.count - 1 else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                vc.dataSource = self.answers
                self.navigationController?.pushViewController(vc, animated: true)
                return
            }
            let nextIndex = IndexPath(item: index, section: 0)
            self.questionCollectionView.scrollToItem(at: nextIndex, at: .right, animated: true)
        }
        
        return cell
    }
}

extension QuestionViewController: UICollectionViewDelegateFlowLayout {
    // Min spacing between items in a section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Min spacing between rows or columns in a section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Margin content in section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    // Size For Item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return questionCollectionView.frame.size
    }
}
