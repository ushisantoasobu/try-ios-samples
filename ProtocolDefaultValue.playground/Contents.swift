import UIKit

var greeting = "Hello, playground"

protocol Some {
    func hoge()
    func hoge(text: String)
}

extension Some {
    func hoge(text: String = "aaa") {
        print(text)
    }
}

struct RealSome: Some {
    
    func hoge() {
        print("text")
    }
}

let some = RealSome()
some.hoge()
some.hoge(text: "andpad")
