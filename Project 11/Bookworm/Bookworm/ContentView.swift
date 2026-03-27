//
//  ContentView.swift
//  Bookworm
//
//  Created by Amanzhol on 27.03.2026.
//

// Bookworm part one

// Introduction to SwiftData and SwiftUI
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
            
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    // more code to come
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// Accepting multi-line text input with TextEditor
//import SwiftUI
//
//struct ContentView: View {
//    
//    @AppStorage("notes") private var notes = ""
//        
//    var body: some View {
//        NavigationStack {
////            TextEditor(text: $notes)
////                .navigationTitle("Notes")
////                .padding()
//            TextField("Enter your text", text: $notes, axis: .vertical)
//                .textFieldStyle(.roundedBorder)
//                .navigationTitle("Notes")
//                .padding()
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

// Creating a custom component with @Binding
//import SwiftUI
//
//struct PushButton: View {
//    let title: String
////    @State var isOn: Bool
//    @Binding var isOn: Bool
//    
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//    
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct ContentView: View {
//    
//    @State private var rememberMe = false
//    
//    var body: some View {
//        VStack {
//            PushButton(title: "Remember Me", isOn: $rememberMe)
//            Text(rememberMe ? "On" : "Off")
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
