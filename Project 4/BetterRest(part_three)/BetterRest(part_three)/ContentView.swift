//
//  ContentView.swift
//  BetterRest(part_three)
//
//  Created by Amanzhol on 22.03.2026.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    var bedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )

            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "Error calculating bedtime"
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.blue.opacity(0.7), .purple.opacity(0.7)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("BetterRest")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.white, .yellow],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.top, 0)
                        .padding(.bottom, 2)
                    
                    Form {
                        Section {
                            InputCard(title: "⏰ When do you want to wake up?") {
                                DatePicker(
                                    "Please enter a time",
                                    selection: $wakeUp,
                                    displayedComponents: .hourAndMinute
                                )
                                .labelsHidden()
                                .frame(maxWidth: .infinity)
                            }
                        }
                        
                        Section {
                            InputCard(title: "Desired amount of sleep 😴 ") {
                                Stepper(
                                    "\(sleepAmount.formatted()) hours",
                                    value: $sleepAmount,
                                    in: 4...12,
                                    step: 0.25
                                )
                            }
                        }
                        
                        Section {
                            InputCard(title: "Daily coffee intake ☕️") {
                                Picker("Number of cups", selection: $coffeeAmount) {
                                    ForEach(1...20, id: \.self) {
                                        Text("^[\($0) cup](inflect: true)")
                                    }
                                }
                                .pickerStyle(.navigationLink)
                            }
                        }
                        
                        Section {
                            BedtimeResultCard(bedtime: bedtime, coffeeAmount: coffeeAmount)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
                .padding(.horizontal)
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct InputCard<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .cardTitleStyle()

            content
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 20))
    }
}

struct BedtimeResultCard: View {
    let bedtime: String
    let coffeeAmount: Int

    var body: some View {
        VStack(spacing: 10) {
            Text("😴 Your ideal bedtime(🛏️) is ")
                .font(.headline)
                .foregroundStyle(.secondary)

            Text(bedtime)
                .bedtimeValueStyle()
                .foregroundStyle(coffeeAmount >= 6 ? .red : .blue)

            if coffeeAmount >= 6 {
                Text("That’s a lot of coffee ☕️")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.red.opacity(0.8))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 35)
        .frame(maxWidth: .infinity)
        .listRowBackground(Color.clear)
        .listRowInsets(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 24))
    }
}

struct CardTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.secondary)
    }
}

struct BedtimeValueModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 40, weight: .bold, design: .rounded))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
    }
}

extension View {
    func cardTitleStyle() -> some View {
        modifier(CardTitleModifier())
    }

    func bedtimeValueStyle() -> some View {
        modifier(BedtimeValueModifier())
    }
}

/*
struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
        
    }
    
    var bedtime: String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            return "Sorry, there was a problem calculating your bedtime."
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("When do you want to wake up?") {
                    
                    DatePicker(
                        "Please enter a time",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                                
                Section("Desired amount of sleep") {
                
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25)
                }
                
                Section("Daily coffee intake") {
                    
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text("^[\($0) cup](inflect: true)")
                        }
                    }
                }
                
                Section("Your ideal bedtime is") {
                    Text(bedtime)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
}
*/

#Preview {
    ContentView()
}
