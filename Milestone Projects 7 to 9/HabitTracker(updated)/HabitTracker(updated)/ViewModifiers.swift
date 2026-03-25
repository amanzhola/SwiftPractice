//
//  ViewModifiers.swift
//  HabitTracker(updated)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct GlassCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            .shadow(radius: 8)
    }
}

struct SectionTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.bold())
            .foregroundStyle(.primary)
    }
}

struct SmallLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

extension View {
    func glassCardStyle() -> some View {
        modifier(GlassCardModifier())
    }

    func sectionTitleStyle() -> some View {
        modifier(SectionTitleModifier())
    }

    func smallLabelStyle() -> some View {
        modifier(SmallLabelModifier())
    }
}

#Preview("View Modifiers Demo") {
    ZStack {
        AppBackgroundView()

        VStack(alignment: .leading, spacing: 14) {
            Text("Overview")
                .sectionTitleStyle()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Habits")
                        .smallLabelStyle()

                    Text("5")
                        .font(.title2.bold())
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Completed")
                        .smallLabelStyle()

                    Text("24")
                        .font(.title2.bold())
                }
            }
        }
        .glassCardStyle()
        .padding()
    }
}
