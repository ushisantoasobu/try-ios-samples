//
//  ViewController.swift
//  ResearchSplitView
//
//  Created by 佐藤俊輔 on 2023/06/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var loadingLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        valueLabel.text = "\(SomeValue.shared.value)"
        
        loadingLabel.text = "loading..."
        loadingLabel.isHidden = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(observed),
            name: someNotification,
            object: nil
        )
        
//        let hoge = SomeValue()
        print("@@@@@ UIApplication.shared.delegate?.window: \(UIApplication.shared.delegate?.window??.bounds)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! //このタッチイベントの場合確実に1つ以上タッチ点があるので`!`つけてOKです
        let location = touch.location(in: self.view) //in: には対象となるビューを入れます
        print(location)
    }
    
    @objc func observed() {
        valueLabel.text = "\(SomeValue.shared.value)"
    }

    @IBAction func buttonTapped(_ sender: Any) {
        Task {
            loadingLabel.isHidden = false
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            SomeValue.shared.value += 1
            NotificationCenter.default.post(name: someNotification, object: nil)
            loadingLabel.isHidden = true
        }
    }
}

let someNotification: Notification.Name = .init("some")

class SomeValue {
    private init() {}
    
    static var shared: SomeValue = .init()
    
    var value: Int = 0
}
