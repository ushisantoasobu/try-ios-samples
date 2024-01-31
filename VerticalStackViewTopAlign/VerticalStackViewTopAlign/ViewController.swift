//
//  ViewController.swift
//  VerticalStackViewTopAlign
//
//  Created by 佐藤俊輔 on 2023/01/25.
//

import UIKit

class ViewController: UIViewController {

    let some = Some()
    var hoge: Hoge?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        some.hoge()
//        await some.hoge()
        
        Task {
//            some.hoge()
            await some.hoge()
        }
        
        if hoge?.someBoolean {
            print("aaa")
        } else {
            print("bbb")
        }
    }
}

class Some {
    
    func hoge() async {
        print("async")
    }
    
    func hoge() {
        print("non-async")
    }
}

class Hoge {
    var someBoolean: Bool = false
}
