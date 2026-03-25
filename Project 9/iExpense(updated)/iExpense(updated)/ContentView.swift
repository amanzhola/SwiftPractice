//
//  ContentView.swift
//  iExpense(updated)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
            items = decodedItems
        } else {
            items = []
        }
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()

    var personalItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }

    var businessItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }

    var totalAmount: Double {
        expenses.items.reduce(0, { $0 + $1.amount })
    }

    var body: some View {
        NavigationStack {
            List {
                if expenses.items.isEmpty {
                    Section {
                        ContentUnavailableView(
                            "No Expenses Yet",
                            systemImage: "creditcard",
                            description: Text("Tap the plus button to add your first expense.")
                        )
                        .frame(maxWidth: .infinity, minHeight: 220)
                    }
                    .listRowBackground(Color.clear)
                } else {
                    Section {
                        summaryCard
                            .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                            .listRowBackground(Color.clear)
                    }

                    Section("Personal") {
                        ForEach(personalItems) { item in
                            ExpenseRow(item: item)
                        }
                        .onDelete { offsets in
                            removeItems(offsets, from: personalItems)
                        }
                    }

                    Section("Business") {
                        ForEach(businessItems) { item in
                            ExpenseRow(item: item)
                        }
                        .onDelete { offsets in
                            removeItems(offsets, from: businessItems)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !expenses.items.isEmpty {
                        EditButton()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddView(expenses: expenses)
                    } label: {
                        Label("Add Expense", systemImage: "plus")
                    }
                }
            }
        }
    }

    var summaryCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Overview")
                .font(.headline)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Total")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text(
                        totalAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .font(.title2.bold())
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Items")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text("\(expenses.items.count)")
                        .font(.title3.bold())
                }
            }
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .padding(.horizontal)
    }

    func removeItems(_ offsets: IndexSet, from source: [ExpenseItem]) {
        for index in offsets {
            let item = source[index]

            if let realIndex = expenses.items.firstIndex(where: { $0.id == item.id }) {
                expenses.items.remove(at: realIndex)
            }
        }
    }
}

struct ExpenseRow: View {
    let item: ExpenseItem

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(iconBackground)
                    .frame(width: 42, height: 42)

                Image(systemName: item.type == "Personal" ? "person.fill" : "briefcase.fill")
                    .foregroundStyle(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)

                Text(item.type)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(
                item.amount,
                format: .currency(code: Locale.current.currency?.identifier ?? "USD")
            )
            .font(.headline)
            .foregroundStyle(amountColor)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(amountColor.opacity(0.12))
            .clipShape(Capsule())
        }
        .padding(.vertical, 4)
    }

    var amountColor: Color {
        if item.amount < 10 {
            return .green
        } else if item.amount < 100 {
            return .orange
        } else {
            return .red
        }
    }

    var iconBackground: Color {
        item.type == "Personal" ? .blue : .purple
    }
}

#Preview {
    ContentView()
}
