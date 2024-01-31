//
//  ContentView.swift
//  ResearchStructEnvironment
//
//  Created by 佐藤俊輔 on 2023/05/08.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct Environment {
    let name: String
}
