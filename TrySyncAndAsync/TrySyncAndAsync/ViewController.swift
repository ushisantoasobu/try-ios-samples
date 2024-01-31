//
//  ViewController.swift
//  TrySyncAndAsync
//
//  Created by 佐藤俊輔 on 2023/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    private let downloadingItemsQueue = DispatchQueue(label: "jp.andpad.andpad-blueprint-ios.networker.downloadingItems.thread-safe")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print("@@@@@ isEmpty(): \(isEmpty())")
        
        let decoder = JSONDecoder()
        
        do {
            let hoge1 = try decoder.decode(Hoge.self, from: okJson.data(using: .utf8)!)
            print("@@@@@ hoge1: \(hoge1)")
            
            let hoge2 = try decoder.decode(Hoge.self, from: justString.data(using: .utf8)!)
            print("@@@@@ hoge2: \(hoge2)")
            
            let hoge3 = try decoder.decode(Hoge.self, from: ngJson.data(using: .utf8)!)
            print("@@@@@ hoge3: \(hoge3)")
        } catch {
            print(error)
        }
    }
}

struct Hoge: Codable {
    let name: String
}

let okJson = """
{"name": "A.Iniesta"}
"""

let ngJson = """
{"a": "b"}
"""

let justString = """
null
"""
