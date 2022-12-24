//
//  CounterView.swift
//  ThinkingInSwiftUI
//
//  Created by Shunsuke Sato on 2022/12/24.
//

import SwiftUI

struct CounterView: View {

    @State var counter: Int = 0

    var body: some View {
        VStack {
            Button {
                counter += 1
            } label: {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(5)
            }

            if counter > 0 {
                Text("You've tapped \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
    }
}
