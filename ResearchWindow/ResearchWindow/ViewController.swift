//
//  ViewController.swift
//  ResearchWindow
//
//  Created by 佐藤俊輔 on 2023/05/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapped(_ sender: Any) {
        let window = UIWindow(windowScene: view.window!.windowScene!)
//        let window = UIWindow(frame: .init(x: 0, y: 0, width: 100, height: 100))
        let temp = UIStoryboard.init(name: "Temp", bundle: nil)
        window.rootViewController = temp.instantiateInitialViewController()
        window.makeKeyAndVisible()
        
        Task {
            try! await Task.sleep(nanoseconds: 2_000_000_000)
            window.rootViewController = nil
        }
    }
}

