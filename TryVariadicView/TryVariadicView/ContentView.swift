//
//  ContentView.swift
//  TryVariadicView
//
//  Created by 佐藤俊輔 on 2023/05/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Spacer()
            
            DividedVStack {
                Text("1")
                    .padding()
                Text("2")
                    .padding()
                Text("3")
                    .padding()
            }
            .border(.red)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ref: https://zenn.dev/ribilynn/articles/3f1df059e67b85

//struct DividedVStack<Content: View>: View {
//    @ViewBuilder let content: () -> Content
//
//    var body: some View {
//        // ...ここに何を書く？
//        content() // ただの some View
//
//
//    }
//}



struct DividedVStack<Content: View>: View {
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        _VariadicView.Tree(DividedVStackLayout(), content: content)
    }
}



struct DividedVStackLayout: _VariadicView_ViewRoot {
    @ViewBuilder
    func body(children: _VariadicView.Children) -> some View {
        VStack(spacing: 0) {
            // 1
            ForEach(children) { child in
            // 2
                child
                // 3
                if child.id != children.last?.id {
                    Divider()
                }
            }
        }
    }
}
