//
//  ContentView.swift
//  Navigation(part_one)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You select \(selection)")
            }
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}


//struct DetailsView: View {
//    var number: Int
//    
//    var body: some View {
//        Text("Details \(number)")
//    }
//    
//    init(number: Int) {
//        self.number = number
//        print("Creating detail view \(number)")
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            List(0..<100) { i in
//                NavigationLink("Tap Me") {
//                    DetailsView(number: i)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
