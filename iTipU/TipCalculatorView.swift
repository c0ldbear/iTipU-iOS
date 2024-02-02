//
//  ContentView.swift
//  iTipU
//
//  Created by Teddy Juhlin-Henricson on 2024-02-02.
//

import SwiftUI

struct TipCalculatorView: View {

    @StateObject var viewModel = TipCalculatorViewModel()

    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Enter Bill Amount")
                    .font(.largeTitle)
                    .foregroundStyle(.secondary)

                TextField("0", text: $viewModel.enteredAmount)
                    .font(.title2)
                    .fontWeight(.bold)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
            }

            Text("Tip: \(viewModel.tipSlider, specifier: "%.f")%")
                .fontWeight(.light)

            Slider(value: $viewModel.tipSlider, in: 0...50, step: 1)
                .onChange(of: viewModel.tipSlider) { [weak viewModel] _, _ in
                    viewModel?.calculateTip()
                    viewModel?.calculateTotal()
                }

            VStack {
                Text("\(viewModel.amount, specifier: "%.f") kr")
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

                Text("\(viewModel.totalAmount, specifier: "%.2f") kr")
                    .font(.title)
                    .fontWeight(.bold)

                Text("VAT included (\(viewModel.VAT, specifier: "%.f")%)")
                    .foregroundStyle(.tertiary)
                    .font(.subheadline)
                    .fontWeight(.light)
            }

        }
        .padding()
    }
}

#Preview {
    TipCalculatorView()
}
