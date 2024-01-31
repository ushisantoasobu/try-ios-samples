//
//  ContentView.swift
//  TryButtonStyle
//
//  Created by 佐藤俊輔 on 2023/05/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // onTapGesture
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
            .border(.red)
            .onTapGesture {
                print("onTapGesture")
            }
            
            // button
            Button {
                print("Button")
            } label: {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                }
                .padding()
                .border(.red)
            }
            
            // button
            Button {
                print("Button")
            } label: {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                }
                .padding()
                .border(.red)
            }
            .buttonStyle(
                FloatingActionButtonStyle(
                    backgroundColor: .red,
                    foregroundColor: .blue
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// https://qiita.com/uhooi/items/6da919e14f71270eda1b
struct FloatingActionButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
//            .frame(width: 56, height: 56)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(16)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
