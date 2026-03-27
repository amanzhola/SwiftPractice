//
//  ContentView.swift
//  Bookworm(final)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext

    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]

    @State private var showingAddScreen = false

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

                VStack(spacing: 16) {
                    Text("Bookworm")
                        .bookTitleStyle()
                        .padding(.top, 8)

                    if books.isEmpty {
                        ContentUnavailableView(
                            "No Books Yet",
                            systemImage: "books.vertical",
                            description: Text("Tap the plus button to add your first book.")
                        )
                        .foregroundStyle(.white)
                    } else {
                        List {
                            ForEach(books) { book in
                                NavigationLink(value: book) {
                                    BookRowView(book: book)
                                        .listRowInsets(
                                            EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0)
                                        )
                                }
                            }
                            .onDelete(perform: deleteBooks)
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                    }
                }
                .padding(.horizontal)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .tint(.white)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }

    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
