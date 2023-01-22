//
//  SomeViewModelTests.swift
//  TryQuick6Tests
//
//  Created by Shunsuke Sato on 2023/01/22.
//

import XCTest

import Quick
import Nimble

@testable import TryQuick6

// MARK: - XCTest, @MainActorでテストクラスを定義しないパターン

//final class SomeViewModelTests: XCTestCase {
//
//    func testExample() throws {
//        Task { @MainActor in
//            let vm = SomeViewModel()
//            XCTAssertEqual(vm.someList.count, 0)
//            vm.insert()
//            XCTAssertEqual(vm.someList.count, 1)
//        }
//    }
//}

// MARK: - XCTest, @MainActorでテストクラスを定義するパターン

//@MainActor
//final class SomeViewModelTests: XCTestCase {
//
//    func testExample() throws {
//        let vm = SomeViewModel()
//        XCTAssertEqual(vm.someList.count, 0)
//        vm.insert()
//        XCTAssertEqual(vm.someList.count, 1)
//    }
//}

// MARK: - Quickを利用するパターン
// printでスレッド表示してみた感じ、「特定の"同一の"スレッドで動くぽい」
class SomeViewModelTests: QuickSpec {

    override func spec() {

        beforeEach {
            print("@@@@@ beforeEach: \(Thread.current)")
        }

        afterEach {
            print("@@@@@ afterEach: \(Thread.current)")
        }

        describe("insert") {

            beforeEach {
                print("@@@@@ beforeEach in describl@e: \(Thread.current)")
            }

            it("has everything you need to get started") {
                print("@@@@@ it in describle: \(Thread.current)")
                expect(1).to(equal(1))
            }
        }
    }
}
