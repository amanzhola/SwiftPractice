//
//  ViewModifiers.swift
//  CupcakeCorner(updated2)
//
//  Created by Amanzhol on 27.03.2026.
//

import SwiftUI

struct AppBackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [
                .pink.opacity(0.75),
                .purple.opacity(0.85),
                .blue.opacity(0.75)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct ScreenTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 22))
            .shadow(radius: 8)
    }
}

struct StyledTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.words)
            .padding()
            .background(Color.white.opacity(0.92))
            .clipShape(.rect(cornerRadius: 14))
    }
}

struct PrimaryButtonModifier: ViewModifier {
    @Environment(\.isEnabled) private var isEnabled
    
    func body(content: Content) -> some View {
        content
            .font(.headline.bold())
            .foregroundStyle(.white)
            .padding()
            .background(isEnabled ? Color.pink : Color.gray.opacity(0.6))
            .clipShape(.rect(cornerRadius: 16))
            .shadow(radius: 5)
            .opacity(isEnabled ? 1 : 0.7)
    }
}

extension View {
    func screenTitleStyle() -> some View {
        modifier(ScreenTitleModifier())
    }
    
    func cardStyle() -> some View {
        modifier(CardModifier())
    }
    
    func styledTextField() -> some View {
        modifier(StyledTextFieldModifier())
    }
    
    func primaryButtonStyle() -> some View {
        modifier(PrimaryButtonModifier())
    }
}
