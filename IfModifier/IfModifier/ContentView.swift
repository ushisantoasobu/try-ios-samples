//
//  ContentView.swift
//  IfModifier
//
//  Created by 佐藤俊輔 on 2023/05/01.
//

import SwiftUI

struct ContentView: View {
    
    @State var some = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            // 1
//            Text("Hello, world!")
//                .if(some) {
//                    $0.foregroundColor(.red)
//                }
            
//            if some {
//                Text("Hello, world!")
//                    .foregroundColor(.black)
//            } else {
//                Text("Hello, world!")
//                    .foregroundColor(.red)
//            }
            
//            Text("Hello, world!")
//                .foregroundColor(some ? .black : .red)
//
            
            
            // 2
            Text("Hello, world!")
                .if(some) {
                    $0.foregroundColor(.red)
                } else: {
                    $0.foregroundColor(.black)
                }

            Button("toggle") {
                some.toggle()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ref: https://zenn.dev/kntk/articles/4e3538f402d171
extension View {
    
    // 1
    /*
     Text("Hello, world!")
         .if(some) {
             $0.foregroundColor(.red)
         }
     */
//    @ViewBuilder
//    func `if`<Content: View>(
//        _ condition: Bool,
//        @ViewBuilder transform: (Self) -> Content
//    ) -> some View {
//        if condition {
//            transform(self)
//        } else {
//            self
//        }
//    }

    @ViewBuilder
    func `if`<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        @ViewBuilder _ then: (Self) -> TrueContent,
        @ViewBuilder `else`: (Self) -> FalseContent
    ) -> some View {
        if condition {
            then(self)
        } else {
            `else`(self)
        }
    }
}
