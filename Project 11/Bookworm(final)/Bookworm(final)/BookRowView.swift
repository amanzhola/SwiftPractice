//
//  BookRowView.swift
//  Bookworm(final)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI

struct BookRowView: View {
    let book: Book

    var body: some View {
        HStack(spacing: 16) {
            EmojiRatingView(rating: book.rating)
                .font(.system(size: 42))

            VStack(alignment: .leading, spacing: 6) {
                Text(book.title)
                    .font(.headline)
                    .foregroundStyle(book.rating == 1 ? .red : .primary)

                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(book.genre)
                    .genreBadgeStyle()
            }

            Spacer()
        }
        .bookCardStyle()
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(book.rating == 1 ? .red.opacity(0.35) : .clear, lineWidth: 1.5)
        )
    }
}

#Preview {
    let book = Book(
        title: "The Hobbit",
        author: "J.R.R. Tolkien",
        genre: "Fantasy",
        review: "Amazing adventure",
        rating: 1
    )

    return BookRowView(book: book)
        .padding()
}
