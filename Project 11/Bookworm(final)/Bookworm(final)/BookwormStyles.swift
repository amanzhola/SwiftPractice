//
//  BookwormStyles.swift
//  Bookworm(final)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI

struct BookTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
            .shadow(radius: 3)
    }
}

struct BookCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
    }
}

struct GenreBadgeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption.weight(.bold))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(.black.opacity(0.7))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

extension View {
    func bookTitleStyle() -> some View {
        modifier(BookTitleModifier())
    }

    func bookCardStyle() -> some View {
        modifier(BookCardModifier())
    }

    func genreBadgeStyle() -> some View {
        modifier(GenreBadgeModifier())
    }
}
