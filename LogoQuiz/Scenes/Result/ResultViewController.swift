//
//  ResultViewController.swift
//  LogoQuiz
//
//  Created by nguyen.duc.huyb on 6/21/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {
    @IBOutlet private weak var resultTableView: UITableView!

    private var results: [Result] = [] {
        didSet {
            resultTableView.reloadData()
        }
    }
    var dataSource = [Int: Bool] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setupData()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        resultTableView.frame = CGRect(x: resultTableView.frame.origin.x, y: resultTableView.frame.origin.y, width: resultTableView.frame.size.width, height: resultTableView.contentSize.height)
        resultTableView.reloadData()
    }
    
    private func config() {
        navigationItem.title = "Result Table"
        resultTableView.tableFooterView = UIView(frame: CGRect.zero)
        resultTableView.rowHeight = 44;
        resultTableView.register(UINib.init(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: "ResultCell")
    }
    
    private func setupPopView(_ currentIndex: Int) {
        let popvc = storyboard?.instantiateViewController(withIdentifier: "PopViewController") as! PopViewController
        popvc.index = currentIndex
        addChild(popvc)
        popvc.view.frame = self.view.frame
        view.addSubview(popvc.view)
        popvc.didMove(toParent: self)
    }
    
    private func setupData() {
        for (key, value) in dataSource {
            let res = Result(id: key, isCorrect: value)
            results.append(res)
        }
        results.sort {
            $0.id < $1.id
        }
    }
    
    @IBAction func handleDoneButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultCell
        cell.configCell(result: results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        setupPopView(indexPath.row)
    }
}
