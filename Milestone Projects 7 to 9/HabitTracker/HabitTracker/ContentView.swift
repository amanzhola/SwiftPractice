//
//  ContentView.swift
//  HabitTracker
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completionCount: Int
}

@Observable
class Habits {
    var activities: [Habit] = [] {
        didSet {
            save()
        }
    }

    init() {
        load()
    }

    func save() {
        if let encoded = try? JSONEncoder().encode(activities) {
            UserDefaults.standard.set(encoded, forKey: "Habits")
        }
    }

    func load() {
        guard let savedData = UserDefaults.standard.data(forKey: "Habits"),
              let decoded = try? JSONDecoder().decode([Habit].self, from: savedData) else {
            activities = []
            return
        }

        activities = decoded
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationStack {
            List {
                if habits.activities.isEmpty {
                    ContentUnavailableView(
                        "No Habits Yet",
                        systemImage: "checklist",
                        description: Text("Tap the plus button to add your first habit.")
                    )
                } else {
                    ForEach(habits.activities) { habit in
                        NavigationLink {
                            HabitDetailView(habit: habit, habits: habits)
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(habit.title)
                                        .font(.headline)

                                    Text(habit.description)
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(2)
                                }

                                Spacer()

                                VStack(alignment: .trailing, spacing: 4) {
                                    Text("\(habit.completionCount)")
                                        .font(.title3.bold())
                                    Text("times")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .onDelete(perform: removeHabits)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !habits.activities.isEmpty {
                        EditButton()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Habit", systemImage: "plus") {
                        showingAddHabit = true
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }

    func removeHabits(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
