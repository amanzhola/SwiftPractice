//
//  AppBackgroundView.swift
//  iExpense(updated_2)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct AppBackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [
                .blue.opacity(0.75),
                .purple.opacity(0.65),
                .pink.opacity(0.35)
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
