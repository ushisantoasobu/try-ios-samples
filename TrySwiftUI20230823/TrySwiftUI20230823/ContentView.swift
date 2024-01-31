//
//  ContentView.swift
//  TrySwiftUI20230823
//
//  Created by 佐藤俊輔 on 2023/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            VStack {
                Spacer()
                Divider()
                    .background(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 480, height: 48))
    }
}
