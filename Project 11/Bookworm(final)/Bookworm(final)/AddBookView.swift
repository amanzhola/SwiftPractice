//
//  AddBookView.swift
//  Bookworm(final)
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
                    VStack(spacing: 14) {
                        Text("Add Book")
                            .bookTitleStyle()

                        VStack(alignment: .leading, spacing: 14) {
                            Text("Book details")
                                .font(.headline)

                            TextField("Name of book", text: $title)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(0.9))
                                .clipShape(.rect(cornerRadius: 14))

                            TextField("Author's name", text: $author)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(0.9))
                                .clipShape(.rect(cornerRadius: 14))

                            HStack {
                                Text("Genre")
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(.black.opacity(0.65))

                                Spacer()

                                Picker("Genre", selection: $genre) {
                                    ForEach(genres, id: \.self) { genre in
                                        Text(genre)
                                    }
                                }
                                .labelsHidden()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white.opacity(0.9))
                            .clipShape(.rect(cornerRadius: 14))
                        }
                        .bookCardStyle()

                        VStack(alignment: .leading, spacing: 14) {
                            Text("Write a review")
                                .font(.headline)

                            TextField("Write your review", text: $review, axis: .vertical)
                                .lineLimit(5, reservesSpace: true)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(.white.opacity(0.9))
                                .clipShape(.rect(cornerRadius: 14))

                            VStack(alignment: .leading, spacing: 10) {
                                Text("Your rating")
                                    .font(.subheadline.weight(.semibold))

                                RatingView(rating: $rating)
                                    .font(.title2)
                            }
                            .padding()
                            .background(.white.opacity(0.9))
                            .clipShape(.rect(cornerRadius: 14))
                        }
                        .bookCardStyle()

                        Button {
                            let newBook = Book(
                                title: trimmedTitle,
                                author: trimmedAuthor,
                                genre: genre,
                                review: review,
                                rating: rating
                            )

                            modelContext.insert(newBook)
                            dismiss()
                        } label: {
                            Text("Save Book")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(formIsValid ? .white : .white.opacity(0.5))
                                .foregroundStyle(.indigo)
                                .clipShape(.rect(cornerRadius: 16))
                        }
                        .disabled(!formIsValid)
                    }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
