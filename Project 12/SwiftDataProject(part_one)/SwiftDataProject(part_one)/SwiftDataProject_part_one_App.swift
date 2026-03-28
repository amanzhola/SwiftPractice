//
//  SwiftDataProject_part_one_App.swift
//  SwiftDataProject(part_one)
//
//  Created by Amanzhol on 28.03.2026.
//

// +Editing SwiftData model objects

import SwiftUI
import SwiftData

@main
struct SwiftDataProject_part_one_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
