//
//  ContentView.swift
//  Converter(distance)
//
//  Created by Amanzhol on 19.03.2026.
//

import SwiftUI

struct ContentView: View {
    enum LengthUnit: String, CaseIterable, Identifiable {
        case meters = "Meters"
        case kilometers = "Kilometers"
        case feet = "Feet"
        case yards = "Yards"
        case miles = "Miles"
        
        var id: String { rawValue }
    }
    
    @State private var inputValue = 0.0
    @State private var inputUnit: LengthUnit = .meters
    @State private var outputUnit: LengthUnit = .feet
    
    @FocusState private var valueIsFocused: Bool
    
    var convertedValue: Double {
        let valueInMeters: Double
        
        switch inputUnit {
            case .meters: valueInMeters = inputValue
            case .kilometers: valueInMeters = inputValue * 1000
            case .feet: valueInMeters = inputValue * 0.3048
            case .yards: valueInMeters = inputValue * 0.9144
            case .miles: valueInMeters = inputValue * 1609.34
        }
        
        switch outputUnit {
            case .meters: return valueInMeters
            case .kilometers: return valueInMeters / 1000
            case .feet: return valueInMeters / 0.3048
            case .yards: return valueInMeters / 0.9144
            case .miles: return valueInMeters / 1609.34
        }
    }
    
    var body: some View {
       NavigationStack {
            Form {
                Section("Input value") {
                    TextField("Enter value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                }
                
                Section("Input unit") {
                    Picker("Form", selection: $inputUnit) {
                        ForEach(LengthUnit.allCases){ unit in
                            Text(unit.rawValue)
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Output unit") {
                    Picker("To", selection: $outputUnit) {
                        ForEach(LengthUnit.allCases) { unit in
                            Text(unit.rawValue)
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Result") {
                    Text(convertedValue.formatted(.number.precision(.fractionLength(2))))
                }
            }
            .navigationTitle("Length Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


/*
import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "feet"
    
    let units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var convertedValue: Double {
        let valueInMeters: Double
        
        switch inputUnit {
            case "meters": valueInMeters = inputValue
            case "kilometers": valueInMeters = inputValue * 1000
            case "feet": valueInMeters = inputValue * 0.3048
            case "yards": valueInMeters = inputValue * 0.9144
            case "miles": valueInMeters = inputValue * 1609.34
            default: valueInMeters = inputValue
        }
        
        switch outputUnit {
            case "meters": return valueInMeters
            case "kilometers": return valueInMeters / 1000
            case "feet": return valueInMeters / 0.3048
            case "yards": return valueInMeters / 0.9144
            case "miles": return valueInMeters / 1609.34
            default: return valueInMeters
        }
    }
    
    var body: some View {
       NavigationStack {
            Form {
                Section("Input value") {
                    TextField("Enter value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section("Output unit") {
                    Picker("Form", selection: $inputUnit) {
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text(convertedValue.formatted())
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
*/
