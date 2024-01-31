//
//  StateObjectView.swift
//  ThinkingInSwiftUI
//
//  Created by Shunsuke Sato on 2023/01/04.
//

import SwiftUI

/**
 @StateObjectの挙動を確かめるためのもの
 */
struct StateObjectView: View {

    @State var someValue: Int = 0

    var body: some View {
        VStack(spacing: 24) {
            // これをtapしたときに stateobjectの方のみ値が保持されることがわかった
            Text("Tap me!!")
                .onTapGesture {
                    someValue += 1
                }
            if someValue < 100 {
                InnerStateObjectView()
            }
        }
    }
}

fileprivate struct InnerStateObjectView: View {

    @StateObject var someStateObject = SomeStateObject()
    @ObservedObject var someObservedObject = SomeObservedObject()

    var body: some View {
        VStack(spacing: 8) {
            Text("Update")
                .onTapGesture {
                    someStateObject.someValue = 123
                    someObservedObject.someValue = 456
                }
            Text("\(someStateObject.someValue)")
            Text("\(someObservedObject.someValue)")
        }
    }
}

class SomeStateObject: ObservableObject {
    @Published var someValue: Int = 0
}

class SomeObservedObject: ObservableObject {
    @Published var someValue: Int = 0
}

struct StateObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}
