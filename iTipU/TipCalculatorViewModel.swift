//
//  TipCalculatorViewModel.swift
//  iTipU
//
//  Created by Teddy Juhlin-Henricson on 2024-02-02.
//

import Foundation

class TipCalculatorViewModel: ObservableObject {
    @Published var amount: Double = 0
    @Published var totalAmount: Double = 0
    @Published var tipAmount: Double = 0
    @Published var tipSlider: Double = 0 {
        didSet {
            tipAmount = tipSlider
        }
    }
    @Published var enteredAmount: String = "0" {
        didSet {
            calculateTip()
            calculateTotal()
        }
    }
    let VAT: Double = 25

    func calculateTip() {
        guard let enteredAmount = Double(enteredAmount) else {
            print("Invalid Entry")
            return
        }

        amount = multiplyPercentage(to: enteredAmount, with: tipAmount)
    }

    func calculateTotal() {
        totalAmount = multiplyPercentage(to: amount, with: VAT)
    }

    private func multiplyPercentage(to amount: Double, with percentage: Double) -> Double {
        (amount * (1 + percentage / 100) * 100).rounded() / 100
    }
}
