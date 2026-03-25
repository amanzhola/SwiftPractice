//
//  ViewModifiers.swift
//  iExpense(updated_2)
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

struct AmountBadgeModifier: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(color)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.14))
            .clipShape(Capsule())
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

    func amountBadgeStyle(color: Color) -> some View {
        modifier(AmountBadgeModifier(color: color))
    }
}

#Preview("View Modifiers Demo") {
    ZStack {
        LinearGradient(
            colors: [.blue.opacity(0.75), .purple.opacity(0.65), .pink.opacity(0.35)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()

        VStack(alignment: .leading, spacing: 14) {
            Text("Overview")
                .sectionTitleStyle()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Total")
                        .smallLabelStyle()

                    Text("$128.50")
                        .font(.title2.bold())
                }

                Spacer()

                Text("$42.00")
                    .amountBadgeStyle(color: .orange)
            }
        }
        .glassCardStyle()
        .padding()
    }
}
