//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    var habits: Habits

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 12) {
                Text(habit.title)
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text(habit.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }

            VStack(spacing: 8) {
                Text("Completed")
                    .font(.headline)

                Text("\(habit.completionCount)")
                    .font(.system(size: 48, weight: .bold))

                Text(habit.completionCount == 1 ? "time" : "times")
                    .foregroundStyle(.secondary)
            }

            Button {
                incrementCompletion()
            } label: {
                Label("Mark as Done", systemImage: "checkmark.circle.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Habit Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    func incrementCompletion() {
        var updatedHabit = habit
        updatedHabit.completionCount += 1

        if let index = habits.activities.firstIndex(of: habit) {
            habits.activities[index] = updatedHabit
        }
    }
}

#Preview {
    let habits = Habits()
    habits.activities = [
        Habit(
            title: "Practice Guitar",
            description: "Practice chords for 20 minutes every day.",
            completionCount: 3
        )
    ]

    return NavigationStack {
        HabitDetailView(habit: habits.activities[0], habits: habits)
    }
}
