//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Amanzhol on 27.03.2026.
//

// Bookworm part one

// Introduction to SwiftData and SwiftUI(updating current file) by adding modelContainer for Student model
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
