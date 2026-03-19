//
//  ContentView.swift
//  WeSplit
//
//  Created by Amanzhol on 18.03.2026.
//
import SwiftUI

struct ContentView: View {
    let students = ["Amanzhol", "Bek", "Dilbar"]
    @State private var selectedStudent = "Amanzhol"
    
    var body: some View {
        
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent){
                    ForEach(students, id: \.self){
                        Text(($0))
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    ContentView()
}

/*
import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            ForEach(0..<100){
                Text("Row \($0)")
            }
        }
    }
}

#Preview {
    ContentView()
}
*/
/*
import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

#Preview {
    ContentView()
}
*/
/*
import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
*/
/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section {
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
            }
            .navigationTitle(Text("SwiftUI"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
*/
/*
import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 1200.0
    @State private var numberOfPeople = 3
    @State private var tipPercentage = 10
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        Form {
            Text("Each person pays \(totalPerPerson, specifier: "%.2f")")
        }
    }
}
*/
