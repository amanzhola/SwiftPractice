//
//  AddBookView.swift
//  Bookworm(part_four)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""

    let genres = [
        "Fantasy",
        "Science Fiction",
        "Mystery",
        "Horror",
        "Romance",
        "Thriller",
        "Poetry",
        "Kids"
    ]

    var trimmedTitle: String {
        title.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var trimmedAuthor: String {
        author.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var formIsValid: Bool {
        !trimmedTitle.isEmpty && !trimmedAuthor.isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Book details") {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }

                Section("Write a review") {
                    TextField("Write your review", text: $review, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)

                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: trimmedTitle,
                            author: trimmedAuthor,
                            genre: genre,
                            review: review,
                            rating: rating
                        )

                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(!formIsValid)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
