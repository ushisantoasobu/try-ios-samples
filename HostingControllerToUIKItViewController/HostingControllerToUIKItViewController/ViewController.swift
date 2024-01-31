//
//  ViewController.swift
//  HostingControllerToUIKItViewController
//
//  Created by 佐藤俊輔 on 2023/12/14.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func tapped(_ sender: Any) {
        var vc = UIHostingController(rootView: Hoge(handler: nil))
        var hoge = Hoge {
            vc.navigationController?.pushViewController(NextViewController(), animated: true)
        }
        vc = UIHostingController(rootView: hoge)
        
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        
        navigationItem.title = "next"
    }
}
