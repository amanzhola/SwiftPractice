//
//  ContentView.swift
//  HabitTracker(updated)
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
            UserDefaults.standard.set(encoded, forKey: "SavedHabits")
        }
    }

    func load() {
        guard let savedData = UserDefaults.standard.data(forKey: "SavedHabits"),
              let decodedData = try? JSONDecoder().decode([Habit].self, from: savedData) else {
            activities = []
            return
        }

        activities = decodedData
    }
}

struct ContentView: View {
    @State private var habits = Habits()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()

                List {
                    if habits.activities.isEmpty {
                        Section {
                            ContentUnavailableView(
                                "No Habits Yet",
                                systemImage: "checklist",
                                description: Text("Tap the plus button to add your first habit.")
                            )
                            .frame(maxWidth: .infinity, minHeight: 260)
                        }
                        .listRowBackground(Color.clear)
                    } else {
                        Section {
                            SummaryCardView(
                                totalHabits: habits.activities.count,
                                totalCompletions: habits.activities.reduce(0) { $0 + $1.completionCount }
                            )
                            .listRowInsets(
                                EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                            )
                            .listRowBackground(Color.clear)
                        }

                        Section {
                            ForEach(habits.activities) { habit in
                                NavigationLink {
                                    HabitDetailView(habit: habit, habits: habits)
                                } label: {
                                    HabitRowView(habit: habit)
                                }
                            }
                            .onDelete(perform: removeHabits)
                        } header: {
                            SectionHeaderView(title: "Your Habits", systemImage: "sparkles")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !habits.activities.isEmpty {
                        EditButton()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
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

struct HabitRowView: View {
    let habit: Habit

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(circleColor)
                    .frame(width: 48, height: 48)

                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.white)
                    .font(.title3)
            }

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
                    .foregroundStyle(completionColor)

                Text(habit.completionCount == 1 ? "time" : "times")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(completionColor.opacity(0.12))
            .clipShape(Capsule())
        }
        .padding(.vertical, 6)
    }

    var completionColor: Color {
        if habit.completionCount < 5 {
            return .green
        } else if habit.completionCount < 15 {
            return .orange
        } else {
            return .purple
        }
    }

    var circleColor: Color {
        if habit.completionCount < 5 {
            return .blue
        } else if habit.completionCount < 15 {
            return .orange
        } else {
            return .purple
        }
    }
}

struct SummaryCardView: View {
    let totalHabits: Int
    let totalCompletions: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Overview")
                .sectionTitleStyle()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Habits")
                        .smallLabelStyle()

                    Text("\(totalHabits)")
                        .font(.title2.bold())
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Completed")
                        .smallLabelStyle()

                    Text("\(totalCompletions)")
                        .font(.title2.bold())
                }
            }
        }
        .glassCardStyle()
        .padding(.horizontal)
    }
}

struct SectionHeaderView: View {
    let title: String
    let systemImage: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage)
            Text(title)
        }
        .font(.headline)
        .foregroundStyle(.white.opacity(0.95))
        .textCase(nil)
    }
}

#Preview {
    ContentView()
}
