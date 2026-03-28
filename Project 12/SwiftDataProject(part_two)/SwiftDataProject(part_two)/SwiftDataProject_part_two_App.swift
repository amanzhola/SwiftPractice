//
//  SwiftDataProject_part_two_App.swift
//  SwiftDataProject(part_two)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProject_part_two_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
