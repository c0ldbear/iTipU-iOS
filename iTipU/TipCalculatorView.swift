//
//  ContentView.swift
//  iTipU
//
//  Created by Teddy Juhlin-Henricson on 2024-02-02.
//

import SwiftUI

struct TipCalculatorView: View {
    @State var enteredAmount: String = "0"
    @State var tipAmount: Double = 0
    @State var amount: Double = 110
    @State var totalAmount: Double = 137.5
    @State var tipSlider: Double = 10
    let VAT: Double = 0.25

    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Enter Bill Amount")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)

                TextField("0", text: $enteredAmount)
                    .font(.title)
                    .fontWeight(.bold)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
            }

            Text("Tip: \(tipSlider, specifier: "%.f")%")
                .fontWeight(.light)

            Slider(value: $tipSlider, in: 0...50, step: 1)
                .onChange(of: tipSlider) { _, _ in
                    guard let enteredAmount = Double(enteredAmount) else {
                        print("Invalid Entry")
                        return
                    }

                }

            VStack {
                Text("\(amount, specifier: "%.f") kr")
                    .font(.title)
                Text("Amount (ex. VAT)")
                    .foregroundStyle(.tertiary)
                    .font(.subheadline)
                    .fontWeight(.light)
            }

            VStack {

                Text("Total Amount")
                    .foregroundStyle(.secondary)
                    .font(.headline)

                Text("\(totalAmount, specifier: "%.2f") kr")
                    .font(.title)
                    .fontWeight(.bold)

                Text("VAT included (\(VAT * 100, specifier: "%.f")%)")
                    .foregroundStyle(.tertiary)
                    .font(.subheadline)
                    .fontWeight(.light)
            }

        }
        .padding()
    }
}

#Preview {
    TipCalculatorView(enteredAmount: "100")
}
