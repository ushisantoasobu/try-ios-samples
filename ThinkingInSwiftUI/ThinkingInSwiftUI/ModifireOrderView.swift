//
//  ModifireOrderView.swift
//  ThinkingInSwiftUI
//
//  Created by Shunsuke Sato on 2022/12/26.
//

import SwiftUI

struct ModifireOrderView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ModifireOrderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModifireOrderView()
                .padding(16)
                .background(Color.red)
                .border(Color.blue)

            ModifireOrderView()
                .background(Color.red)
                .padding(16)
                .border(Color.blue)
        }
    }
}
