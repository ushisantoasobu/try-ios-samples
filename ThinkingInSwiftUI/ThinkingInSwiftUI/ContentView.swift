//
//  ContentView.swift
//  ThinkingInSwiftUI
//
//  Created by Shunsuke Sato on 2022/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("\(makeSum(hoge: 1 == 1))")
            myView()
        }
        .padding()
        .debug()
    }

    @MyIntSumBuilder func makeSum(hoge: Bool) -> Int {
        1
        2
        3
        4
        if hoge {
            5
        }
        6
    }

    @ViewBuilder
    func myView() -> some View {
     Text("テキスト")
     Text("テキスト")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
