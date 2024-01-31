//
//  ViewController.swift
//  TryNaturalSort
//
//  Created by 佐藤俊輔 on 2023/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [[NSLocale preferredLanguages] firstObject];
        print(Locale.preferredLanguages)
        
        do {
            let list = ["第１", "第１０", "第2", "第3", "第4"]
            print(list.sorted(using: .localizedStandard))
        }
        
        do {
            let list = ["001", "010", "01", "1", "02", "2"]
            print(list.sorted(using: .localizedStandard))
        }
    }
}

