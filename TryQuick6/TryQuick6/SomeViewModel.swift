//
//  SomeViewModel.swift
//  TryQuick6
//
//  Created by Shunsuke Sato on 2023/01/22.
//

import Foundation

@MainActor
class SomeViewModel: ObservableObject {
    @Published var someList: [String] = []

    func insert() {
        let some = UUID().uuidString
        someList.append(some)
    }
}
