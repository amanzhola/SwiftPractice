//
//  ContentView.swift
//  Converter(temperature)
//
//  Created by Amanzhol on 20.03.2026.
//

import SwiftUI

struct ContentView: View {
    enum TemperatureUnit: String, CaseIterable, Identifiable {
        case celsius = "Celcius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
        
        var id: String { rawValue }
    }
    
    @State private var inputValue = 0.0
    @State private var inputUnit: TemperatureUnit = .celsius
    @State private var outputUnit: TemperatureUnit = .fahrenheit
    
    @FocusState private var valueIsFocused: Bool
    
    var convertedValue: Double {
        let valueInCelsius: Double
        
        switch inputUnit {
            case .celsius: valueInCelsius = inputValue
            case .fahrenheit: valueInCelsius = (inputValue - 32) * 5 / 9
            case .kelvin: valueInCelsius = inputValue - 273.15
        }
        
        switch outputUnit {
            case .celsius: return valueInCelsius
            case .fahrenheit: return valueInCelsius * 9 / 5 + 32
            case .kelvin: return valueInCelsius + 273.15
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Enter temperature", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                }
                
                Section("Input unit") {
                    Picker("Form", selection: $inputUnit) {
                        ForEach(TemperatureUnit.allCases) { unit in
                            Text(unit.rawValue)
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output unit") {
                    Picker("To", selection: $outputUnit) {
                        ForEach(TemperatureUnit.allCases) { unit in
                            Text(unit.rawValue)
                                .tag(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text(convertedValue.formatted(.number.precision(.fractionLength(2))))
                }
            }
            .navigationTitle("Temperature Converter")
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
