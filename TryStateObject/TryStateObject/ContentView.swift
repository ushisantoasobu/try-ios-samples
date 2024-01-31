//
//  ContentView.swift
//  TryStateObject
//
//  Created by 佐藤俊輔 on 2023/03/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            
            VStack {
                NavigationLink {
                    VStack {
                        ParentView()
                    }
                } label: {
                    Text("Hello, world!")
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ParentView: View {
    
    @State var some: Int = 0
    
    var body: some View {
        VStack {
            if some > 0 {
                Text("hogehoge")
            }
            ChildView {
                some += 1
            }
        }
    }
}

struct ChildView: View {
    
    @State var showingModal = false
//    @ObservedObject var vm = ChildViewModel()
    @StateObject var vm = ChildViewModel()

    let clickHandler: (() -> Void)
    
    var body: some View {
        VStack {
            Text("\(vm.some)")
            Button("+") {
                vm.some += 1
            }
            Button("change parent") {
                clickHandler()
            }
            Button("show modal") {
                showingModal = true
            }
        }
        .padding()
        .sheet(isPresented: $showingModal) {
            Text("Modal")
        }
    }
}

class ChildViewModel: ObservableObject {
    @Published var some: Int = 0
}
