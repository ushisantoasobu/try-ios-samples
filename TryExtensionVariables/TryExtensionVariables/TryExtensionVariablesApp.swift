//
//  TryExtensionVariablesApp.swift
//  TryExtensionVariables
//
//  Created by 佐藤俊輔 on 2023/07/18.
//

import SwiftUI

@main
struct TryExtensionVariablesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct Hoge {
    let id: Int
    let name: String
}

extension Hoge {
    
    struct LocalIDContainer {
        static var _localId: String = ""
    }
    
    var localId: String {
        get {
            LocalIDContainer._localId
        }
        set(newValue) {
            LocalIDContainer._localId = newValue
        }
    }
}
