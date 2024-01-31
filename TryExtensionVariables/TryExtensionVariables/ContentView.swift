//
//  ContentView.swift
//  TryExtensionVariables
//
//  Created by 佐藤俊輔 on 2023/07/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            var hoge = Hoge(id: 1, name: "a")
            hoge.localId = "aaaaa"
            var fuga = Hoge(id: 2, name: "b")
            fuga.localId = "bbbbb"
            print(hoge.localId)
            print(fuga.localId)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
