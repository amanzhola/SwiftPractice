//
//  DetailView.swift
//  Bookworm(final)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false

    let book: Book

    var genreImageName: String {
        let knownGenres = [
            "Fantasy",
            "Science Fiction",
            "Mystery",
            "Horror",
            "Romance",
            "Thriller",
            "Poetry",
            "Kids"
        ]

        return knownGenres.contains(book.genre) ? book.genre : "Fantasy"
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .indigo.opacity(0.75),
                    .purple.opacity(0.55),
                    .pink.opacity(0.25)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    ZStack(alignment: .bottomTrailing) {
                        Image(genreImageName)
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 24))

                        Text(book.genre.uppercased())
                            .genreBadgeStyle()
                            .padding(12)
                    }

                    VStack(spacing: 10) {
                        Text(book.title)
                            .font(.title.bold())
                            .multilineTextAlignment(.center)

                        Text(book.author)
                            .font(.title3)
                            .foregroundStyle(.secondary)

                        Text(book.date, format: .dateTime.day().month().year().hour().minute())
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .bookCardStyle()

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Review")
                            .font(.headline)

                        Text(book.review.isEmpty ? "No review" : book.review)
                            .foregroundStyle(.primary)
                    }
                    .bookCardStyle()

                    RatingView(rating: .constant(book.rating))
                        .font(.largeTitle)
                        .padding()
                        .bookCardStyle()
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Image(systemName: "trash")
                    .foregroundStyle(.white)
            }
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
    }

    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)

        let example = Book(
            title: "Test Book",
            author: "Test Author",
            genre: "Fantasy",
            review: "This was a great book; I really enjoyed it.",
            rating: 4,
            date: .now
        )

        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
