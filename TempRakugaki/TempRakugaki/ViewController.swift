//
//  ViewController.swift
//  TempRakugaki
//
//  Created by 佐藤俊輔 on 2023/08/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func tap(_ sender: Any) {
        let image = UIImage(named: "beautiful_sweden")!
        let vc = RakugakiViewController.instantiate(image: image)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

