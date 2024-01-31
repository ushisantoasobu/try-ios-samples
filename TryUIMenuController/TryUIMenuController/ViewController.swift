//
//  ViewController.swift
//  TryUIMenuController
//
//  Created by 佐藤俊輔 on 2023/01/31.
//

import UIKit

class ViewController: UIViewController {
    
    var editMenuInteraction: UIEditMenuInteraction?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapped(_ sender: Any) {
        showUIEditMenuInteraction(sender)
//        showUIMenuController(sender)
    }
    
    func showUIEditMenuInteraction(_ sender: Any) {
        let button = sender as! UIButton
        editMenuInteraction = .init(delegate: self)
        button.addInteraction(editMenuInteraction!)
        let configuration = UIEditMenuConfiguration(
          identifier: "hoge",
          sourcePoint: .zero //button.center
        )
        editMenuInteraction?.presentEditMenu(with: configuration)
    }
    
    func showUIMenuController(_ sender: Any) {
        let button = sender as! UIButton
        let menu = UIMenuController.shared
        menu.arrowDirection = .down
        
        let item_1 = UIMenuItem(
            title: "hoge",
            action: #selector(hoge)
        )
        let item_2 = UIMenuItem(
            title: "fuga",
            action: #selector(fuga)
//            action: "fugaa"
        )
        menu.menuItems = [item_1, item_2]
        
        menu.showMenu(from: sender as! UIButton, rect: button.bounds)
    }
    
    @objc func hoge() {
        print("hoge")
    }
    
    @objc func fuga() {
        print("fuga")
    }
}

class Some {
    @objc func fuga() {
        print("fuga of some")
    }
}

extension ViewController: UIEditMenuInteractionDelegate {
    func editMenuInteraction(_ interaction: UIEditMenuInteraction, menuFor configuration: UIEditMenuConfiguration, suggestedActions: [UIMenuElement]) -> UIMenu? {
        UIMenu(children: [
            UIAction(title: "hoge", handler: { _ in
                print("hoge")
            }),
            UIAction(title: "fuga", handler: { _ in
                print("fuga")
            }),
        ])
    }
}
