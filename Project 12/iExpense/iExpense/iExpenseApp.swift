//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Amanzhol on 29.03.2026.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
