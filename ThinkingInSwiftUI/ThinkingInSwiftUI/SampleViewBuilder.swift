//
//  SampleViewBuilder.swift
//  ThinkingInSwiftUI
//
//  Created by Shunsuke Sato on 2022/12/24.
//

import Foundation

// ref: https://www.hackingwithswift.com/swift/5.4/result-builders
// 
@resultBuilder
struct MyIntSumBuilder {

    // if ~を使うのに必要
    static func buildOptional(_ component: Int?) -> Int {
        return component ?? 0
    }

    static func buildBlock(_ parts: Int...) -> Int {
        var value: Int = 0
        parts.forEach { int in
            value += int
        }
        return value
    }

    // if ~ else ~ を使うのに必要
//    static func buildEither(first component: Int) -> Int {
//        return component
//    }
//
//    static func buildEither(second component: Int) -> Int {
//        return component
//    }
}
