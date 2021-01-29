import SwiftUI
import Foundation

struct ContentView: View {
    @State private var d1Text = ""
    @State private var d1Unit = 0
    @State private var d2Unit = 0
    
    let unitLabels = ["m", "km", "ft", "yd", "mi"]

    var d1Value: Double {
        return Double(d1Text) ?? 0
    }
    
    var d2Value: Double {
        let startUnit = UnitLength(symbol: unitLabels[d1Unit])
        let resultUnit = UnitLength(symbol: unitLabels[d2Unit])
        
        let d1Measure = Measurement(value: d1Value, unit: startUnit)
        print(d1Measure)
        print(d1Measure.converted(to: resultUnit))
        return d1Measure.converted(to: resultUnit).value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    TextField("Enter amount", text: $d1Text)
                        .padding()
                    Picker("Unit", selection: $d1Unit) {
                        ForEach(0..<unitLabels.count) {
                            Text("\(unitLabels[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
                Section(header: Text("Result")) {
                    Text("\(d2Value, specifier: "%.2f")\(unitLabels[d2Unit])")
                        .padding()
                    Picker("Unit", selection: $d2Unit) {
                        ForEach(0..<unitLabels.count) {
                            Text("\(unitLabels[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                }
            }
            .navigationBarTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
