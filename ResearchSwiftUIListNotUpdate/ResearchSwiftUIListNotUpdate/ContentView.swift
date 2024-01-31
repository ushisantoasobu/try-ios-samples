//
//  ContentView.swift
//  ResearchSwiftUIListNotUpdate
//
//  Created by 佐藤俊輔 on 2023/11/24.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var someFlg = false
    @Published var list: [Int] = [1,2,3]
}

struct ContentView: View {
    
    @ObservedObject var vm = ContentViewModel()
//    @State var list: [SomeModel] = [
//        SomeModel(index: 1, some: false),
//        SomeModel(index: 2, some: false),
//        SomeModel(index: 3, some: false),
//    ]
    
    var body: some View {
        ZStack {
            VStack {
                if vm.someFlg {
                    Text("someFlg: true")
                } else {
                    Text("someFlg: false")
                }
                List {
                    ForEach(vm.list.map { ($0, vm.someFlg) }, id: \.self) { some in
//                        ContentItem(some: some)
                        ContentItem(index: some.0, some: some.1)
                    }
                }
                Spacer()
            }
            .padding()
            
            VStack {
                HStack {
                    Button {
                        vm.someFlg.toggle()
//                        list = list.map({ someModel in
//                                .init(index: someModel.index, some: someFlg)
//                        })
                        vm.objectWillChange.send()
                    } label: {
                        Text("1")
                    }
                    Button {
//                        list.append(.init(index: list.last!.index + 1, some: someFlg))
                        vm.list.append(vm.list.last! + 1)
                    } label: {
                        Text("2")
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentItem: View {
    
    @State var index: Int
    @State var some: Bool
//    @State var some: SomeModel
    
    var body: some View {
        HStack {
            Text("\(index)")
            Spacer()
            if some {
                Text("true")
            } else {
                Text("false")
            }
        }
    }
}

struct SomeModel: Hashable {
    let index: Int
    let some: Bool
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
