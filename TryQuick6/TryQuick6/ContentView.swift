//
//  ContentView.swift
//  TryQuick6
//
//  Created by Shunsuke Sato on 2023/01/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var vm = SomeViewModel()

    var body: some View {
        VStack {
            Button("add") {
                vm.insert()
            }
            Text("\(vm.someList.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
