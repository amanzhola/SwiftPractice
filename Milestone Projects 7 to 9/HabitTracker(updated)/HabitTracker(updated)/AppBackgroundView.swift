//
//  AppBackgroundView.swift
//  HabitTracker(updated)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct AppBackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [
                .blue.opacity(0.8),
                .purple.opacity(0.7),
                .pink.opacity(0.4)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    AppBackgroundView()
}
