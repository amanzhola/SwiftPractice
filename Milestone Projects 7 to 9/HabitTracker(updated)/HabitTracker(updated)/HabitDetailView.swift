//
//  HabitDetailView.swift
//  HabitTracker(updated)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    var habits: Habits

    var body: some View {
        ZStack {
            AppBackgroundView()

            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Text(habit.title)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)

                    Text(habit.description)
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.85))
                        .multilineTextAlignment(.center)
                }
                .glassCardStyle()
                .padding(.horizontal)

                VStack(spacing: 10) {
                    Text("Completed")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.9))

                    Text("\(habit.completionCount)")
                        .font(.system(size: 52, weight: .bold))
                        .foregroundStyle(.white)

                    Text(habit.completionCount == 1 ? "time" : "times")
                        .foregroundStyle(.white.opacity(0.8))
                }
                .frame(maxWidth: .infinity)
                .glassCardStyle()
                .padding(.horizontal)

                Button {
                    incrementCompletion()
                } label: {
                    Label("Mark as Done", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white.opacity(0.2))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding(.top)
        }
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
            title: "Practice Piano",
            description: "Practice scales and one song for 20 minutes.",
            completionCount: 7
        )
    ]

    return NavigationStack {
        HabitDetailView(habit: habits.activities[0], habits: habits)
    }
}
