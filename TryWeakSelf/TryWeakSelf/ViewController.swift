//
//  ViewController.swift
//  TryWeakSelf
//
//  Created by 佐藤俊輔 on 2023/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var some = Some()
        some.execute()
    }


}

class Some {
    
    var value: Int = 0
    
    private var someFunc: (() -> Void)?
    
    deinit {
        print("some deinit")
    }
    
//    func execute() {
//        value += 1
//        DispatchQueue.main.async {
//            print(self.value)
//        }
//    }
    
//    func execute() {
//        value += 1
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            print(self.value)
//        }
//    }
    
    // deinitが呼ばれない
//    func execute() {
//        someFunc = {
//            print(self.value)
//        }
//        someFunc?()
//    }
    
    // deinitが呼ばれる
    func execute() {
        someFunc = { [weak self] in
            print(self?.value)
        }
        someFunc?()
    }
}

