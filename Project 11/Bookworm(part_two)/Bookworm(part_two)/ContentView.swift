//
//  ContentView.swift
//  Bookworm(part_two)
//
//  Created by Amanzhol on 27.03.2026.
//

// Bookworm part three

// +Using an alert to pop a NavigationLink programmatically
// +Deleting from a SwiftData query
// +Sorting SwiftData queries using SortDescriptor
// +Showing book details (genre and others) -> DetailView

// Bookworm part two

// + Building a list with @Query
// + Adding a custom star rating component (show binding to see reflection on somewhere change )
// Creating books with SwiftData
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    
//    @Query var books: [Book] // -> variants of Sorting SwiftData queries using SortDescriptor ->
//    @Query(sort: \Book.title) var books: [Book] // +Sorting SwiftData queries using SortDescriptor as sample of signle sorting
//    @Query(sort: \Book.rating, order: .reverse) var books: [Book] // +Sorting SwiftData queries using SortDescriptor as sample of single sorting
//    @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
    
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
//            Text("Count: \(books.count)")
            List {
                ForEach(books) {book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    // +Deleting from a SwiftData query
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
