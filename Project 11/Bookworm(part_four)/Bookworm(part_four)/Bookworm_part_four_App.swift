//
//  Bookworm_part_four_App.swift
//  Bookworm(part_four)
//
//  Created by Amanzhol on 27.03.2026.
//

import SwiftUI
import SwiftData

@main
struct Bookworm_part_four_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
