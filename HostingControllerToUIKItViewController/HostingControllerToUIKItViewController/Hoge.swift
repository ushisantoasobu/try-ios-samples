//
//  Hoge.swift
//  HostingControllerToUIKItViewController
//
//  Created by 佐藤俊輔 on 2023/12/14.
//

import SwiftUI

struct Hoge: View {
    
    let handler: (() -> Void)?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                handler?()
            }
            .navigationTitle("hoge")
    }
}

struct Hoge_Previews: PreviewProvider {
    static var previews: some View {
        Hoge(handler: nil)
    }
}
