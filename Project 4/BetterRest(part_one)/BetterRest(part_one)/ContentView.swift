//
//  ContentView.swift
//  BetterRest(part_one)
//
//  Created by Amanzhol on 21.03.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
        }
        .padding()
    }
}

//struct ContentView: View {
//    var body: some View {
//        
//        Text(Date.now.formatted(date: .long, time: .shortened))
////        Text(Date.now, format: .dateTime.day().month().year())
//    }
//    
//    func exampleDates() {
////        var components = DateComponents()
////        components.hour = 8
////        components.minute = 0
////        let date = Calendar.current.date(from: components) ?? .now
//        
//        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//        
////        let now = Date.now
////        let tomorrow = Date.now.addingTimeInterval(86400)
////        let range = now...tomorrow
//    }
//}

//struct ContentView: View {
//    
//    @State private var wakeUp = Date.now
//    
//    var body: some View {
//        
//        DatePicker("Pleae enter a date", selection: $wakeUp, in: Date.now...)
//            .labelsHidden()
//        
////        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents:
////                .hourAndMinute)
////            .labelsHidden()
//    }
//    
//    func exampleDates() {
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tomorrow
//    }
//}

//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var sleepAmount = 8.0
//    
//    var body: some View {
//        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//    }
//}

#Preview {
    ContentView()
}
