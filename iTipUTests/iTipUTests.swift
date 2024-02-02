//
//  iTipUTests.swift
//  iTipUTests
//
//  Created by Teddy Juhlin-Henricson on 2024-02-02.
//

import XCTest
@testable import iTipU

final class iTipUTests: XCTestCase {

    func testTipCalculatorViewModelInitialize() {
        let vm = TipCalculatorViewModel()
        XCTAssertNotNil(vm)
    }

    func testTipCalculatorViewModelPropertiesAfterInit() {
        let vm = TipCalculatorViewModel()
        XCTAssertEqual(vm.amount, 0)
        XCTAssertEqual(vm.totalAmount, 0)
        XCTAssertEqual(vm.tipAmount, 0)
        XCTAssertEqual(vm.enteredAmount, "0")
        XCTAssertEqual(vm.tipSlider, 0)
        XCTAssertEqual(vm.VAT, 25)
    }

    func testTipCalculatorViewModelSetAmountProperty() {
        let vm = TipCalculatorViewModel()
        let testValue: Double = 100
        vm.amount = testValue
        XCTAssertEqual(vm.amount, testValue)
    }

    func testTipCalculatorViewModelCalculateTipWithoutVAT() {
        let vm = TipCalculatorViewModel()
        vm.enteredAmount = "100"
        vm.tipAmount = 10

        vm.calculateTip()
        XCTAssertEqual(vm.amount, 110.00)
    }

    func testTipCalculatorViewModelCalculateTipWithVAT() {
        let vm = TipCalculatorViewModel()
        vm.enteredAmount = "100"
        vm.tipAmount = 10
        vm.calculateTip()

        vm.calculateTotal()
        XCTAssertEqual(vm.totalAmount, 137.5)
    }

}
