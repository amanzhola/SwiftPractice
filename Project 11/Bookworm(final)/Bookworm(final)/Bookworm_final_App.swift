//
//  Bookworm_final_App.swift
//  Bookworm(final)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI
import SwiftData

@main
struct Bookworm_final_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
