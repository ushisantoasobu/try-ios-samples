//
//  ContentView.swift
//  MarkdonwInText
//
//  Created by 佐藤俊輔 on 2023/07/03.
//

import SwiftUI

struct ContentView: View {
    
    let simpleMarkdown = """
    #␣Title
    **iOS**DC␣_Japan_␣‘2023‘
    """
    
//    let temp =
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            SwiftUI.Text("""
## Title
**iOS**DC _Japan_ ‘2023‘
```
var aaa = 0
```
""")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
