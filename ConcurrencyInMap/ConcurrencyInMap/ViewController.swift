//
//  ViewController.swift
//  ConcurrencyInMap
//
//  Created by 佐藤俊輔 on 2023/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Task {
//            let hoge = await culc(number: 10)
//            print(hoge)
//        }
        
        let list = [1,2,3,4,5]
        
//        let strings = list.map { _ in
//            Task {
//                let hoge = await culc(number: 10)
//                return "\(hoge)"
//            }
//        }
//
//        print(strings)
//        print(type(of: strings))
//
//        strings.forEach { task in
//            Task {
//                print(await task.value)
//            }
//        }
        Task {
            let hoge = hoge()
            print(hoge)
        }
    }

    func culc(number: Int) async -> Int {
        number * 3
    }
    
    func hoge() async throws -> String {
        var hoge: String?
        return hoge!
    }
}

