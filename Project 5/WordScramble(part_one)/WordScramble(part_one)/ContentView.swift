//
//  ContentView.swift
//  WordScramble(part_one)
//
//  Created by Amanzhol on 22.03.2026.
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
    
    func testStrings() {
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelRange.location == NSNotFound
        
////        let input = "a b c"
//        let input = """
//            a
//            b
//            c
//            """
////        let letters = input.components(separatedBy: " ")
//        let letters = input.components(separatedBy: "\n")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    
//    func testBndles() {
//        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
//            // we found the file in our bundle!
//            
//            if let fileContents = try? String(contentsOf: fileURL) {
//                // we loaded the file into a string!
//            }
//        
//        }
//    }
        
//        let people = ["Finn", "Leia", "Luke", "Rey"]
//        
//        List {
//            Text("Static Row")
//            
//            ForEach(people, id: \.self) {
//                Text($0)
//            }
//            
//            Text("Static Row")
//        }
//        List(people, id: \.self) {
//            Text($0)
//        }
        
//        List(0..<5) {
//            Text("Dynamic Row \($0)")
//        }
        
//        List {
//            
//            Section("Section 1") {
//                Text("Static Row 1")
//                Text("Static Row 2")
//            }
//            
//            Section("Section 2") {
//                
//                ForEach(0..<5) {
//                    Text("Dynamic Row \($0)")
//                }
//            }
//            
//            Section("Section 3") {
//                Text("Static Row 3")
//                Text("Static Row 4")
//            }
//        }
//        .listStyle(.grouped)
        
//        List {
//            Text("Hello, World!")
//        }
//    }
}

#Preview {
    ContentView()
}
