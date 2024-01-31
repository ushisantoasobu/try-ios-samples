//
//  ContentView.swift
//  CanVariableInResultBuilder
//
//  Created by 佐藤俊輔 on 2023/03/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
//            lazy var name = fetch()
            let name = fetch()
            Text(name)
        }
        .padding()
    }
    
    func fetch() -> String {
        for number in numbers {
            print(double(number))
//            print(optionalDouble(number)) error
        }
        
        return "hoge!!!!"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func double<T: Numeric>(_ number: T) -> T {
    number * 2
}

func optionalDouble<T: Numeric>(_ number: T?) -> T {
    let numberToDouble = number ?? 0
    return  numberToDouble * 2
}


let first = 1
let second = 2.0
let third: Float = 3

let numbers: [any Numeric] = [first, second, third]

class Pet { }
class Dog: Pet {
    func bark() { print("Woof!") }
}

func bark(using pets: [Pet]) {
    switch pets {
    case let pets as [Dog]:
        for pet in pets {
            pet.bark()
        }
    default:
        print("No barking today.")
    }
}
