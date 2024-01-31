//
//  ViewController.swift
//  ForEachTask
//
//  Created by 佐藤俊輔 on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        for i in 0..<5 {
//            Task {
//                let hoge = await fetch(num: i)
//                print("hoge \(hoge)")
//            }
//            print("finished")
//        }
        
        Task {
            for i in 0..<5 {
                let hoge = await fetch(num: i)
                print("hoge \(hoge)")
            }
            print("finished")
        }
    }
    
    func fetch(num: Int) async -> String {
        try! await Task.sleep(nanoseconds: 1_000_000_000)
        return "\(num)"
    }
}

