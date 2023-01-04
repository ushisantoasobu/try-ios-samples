//
//  ViewController.swift
//  ViewModelPassingByRef
//
//  Created by 佐藤俊輔 on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapped(_ sender: Any) {
        let vc = SomeAViewController.instantiate()
        navigationController?.pushViewController(vc, animated: true)
    }
}

class SomeViewModel {
    var name: String = ""
}

class SomeAViewController: UIViewController {
    
    var vm: SomeViewModel!
    
    static func instantiate() -> SomeAViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "A") as! SomeAViewController
        vc.vm = SomeViewModel()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "A"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(vm.name)
    }
    
    @IBAction func tapped(_ sender: Any) {
        let vc = SomeBViewController.instantiate(vm: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
}

class SomeBViewController: UIViewController {
    
    var vm: SomeViewModel!
    
    static func instantiate(vm: SomeViewModel) -> SomeBViewController {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "B") as! SomeBViewController
        vc.vm = vm
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "B"
    }
    
    @IBAction func tapped(_ sender: Any) {
        vm.name = UUID().uuidString
    }
}
