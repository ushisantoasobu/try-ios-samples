//
//  ViewController.swift
//  TryUITableViewInStackView
//
//  Created by 佐藤俊輔 on 2024/01/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: SelfSizingTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = (0...(indexPath.row + 1)).map { _ in "aaaaa bbbbb ccccc" }.joined(separator: ", ")
//        cell.textLabel?.text = "aaaaa bbbbb ccccc ddddd eeeee fffff ggggg hhhhh iiiii"
        
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

class SelfSizingTableView: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
