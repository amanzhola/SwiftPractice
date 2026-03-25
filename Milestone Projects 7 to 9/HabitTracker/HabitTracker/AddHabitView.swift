//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var description = ""

    var habits: Habits

    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var trimmedDescription: String {
        description.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Habit Information") {
                    TextField("Title", text: $title)

                    TextField("Description", text: $description, axis: .vertical)
                        .lineLimit(3...6)
                }
            }
            .navigationTitle("Add Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newHabit = Habit(
                            title: trimmedTitle,
                            description: trimmedDescription,
                            completionCount: 0
                        )

                        habits.activities.append(newHabit)
                        dismiss()
                    }
                    .disabled(trimmedTitle.isEmpty || trimmedDescription.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddHabitView(habits: Habits())
}
