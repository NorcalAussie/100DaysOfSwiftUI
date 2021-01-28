//
//  ContentView.swift
//  WeSplit
//
//  Created by Matthew Pearce on 1/27/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var tipAmount = 2
    @State private var numberOfWays = 2
    
    private let tipPercentages = [2, 5, 10, 15, 20, 25, 30]
    
    var personCount: Double {
        return Double(numberOfWays + 2)
    }
    
    var tipPercentage: Double {
        return Double(tipPercentages[tipAmount])
    }
    
    var tip: Double {
        return amount / 100 * tipPercentage
    }
    
    var amount: Double {
        return Double(checkAmount) ?? 0.00
    }
    
    var checkTotal: Double {
        return amount + tip
    }
    
    var totalAmountPerPerson: Double {
        let amountPerPerson = checkTotal / personCount

        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfWays) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
                }
                Section(header: Text("How much would you like to tip?")) {
                    Picker("Tip Percentage", selection: $tipAmount) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section {
                        Text("Amount: $\(amount, specifier: "%.2f")")
                        Text("Tip: $\(tip, specifier: "%.2f")")
                        Text("Total: $\(checkTotal, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")) {
                    Text("$\(totalAmountPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
