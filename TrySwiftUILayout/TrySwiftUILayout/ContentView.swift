//
//  ContentView.swift
//  TrySwiftUILayout
//
//  Created by 佐藤俊輔 on 2023/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            SomeView()
                .frame(maxHeight: 640)
            Text("Hello, world!")
            Spacer()
            Text("Bottom Message")
        }
        .padding()
    }
}

struct SomeView: View {
    
    private let ratio: CGFloat = 1 // height / width = 2
    
    var body: some View {
        ZStack {
            Color.yellow
            GeometryReader { geometry in
                if geometry.size.height / geometry.size.width > ratio {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: geometry.size.width, height: geometry.size.width * ratio)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: geometry.size.height / ratio, height: geometry.size.height)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
        
        // これでいっぱいに広がる
//        ZStack {
//            Color.yellow
//        }
        
        // これではいっぱいに広がらない
//        ZStack {
//            Text("SomeView")
//        }
//        .edgesIgnoringSafeArea(.all)
//        .border(Color.red)
        
        // これではいっぱいに広がらない
//        ZStack {
//            Text("SomeView")
//        }
//        .frame(width: .infinity, height: .infinity)
//        .border(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
