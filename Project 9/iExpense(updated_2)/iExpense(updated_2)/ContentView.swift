//
//  ContentView.swift
//  iExpense(updated_2)
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
        expenses.items.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()

                List {
                    if expenses.items.isEmpty {
                        Section {
                            ContentUnavailableView(
                                "No Expenses Yet",
                                systemImage: "creditcard",
                                description: Text("Tap the plus button to add your first expense.")
                            )
                            .frame(maxWidth: .infinity, minHeight: 240)
                        }
                        .listRowBackground(Color.clear)
                    } else {
                        Section {
                            SummaryCardView(
                                totalAmount: totalAmount,
                                itemsCount: expenses.items.count
                            )
                            .listRowInsets(
                                EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                            )
                            .listRowBackground(Color.clear)
                        }

                        Section {
                            ForEach(personalItems) { item in
                                ExpenseRow(item: item)
                            }
                            .onDelete { offsets in
                                removeItems(offsets, from: personalItems)
                            }
                        } header: {
                            SectionHeaderView(title: "Personal", systemImage: "person.fill")
                        }

                        Section {
                            ForEach(businessItems) { item in
                                ExpenseRow(item: item)
                            }
                            .onDelete { offsets in
                                removeItems(offsets, from: businessItems)
                            }
                        } header: {
                            SectionHeaderView(title: "Business", systemImage: "briefcase.fill")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
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
                        Image(systemName: "plus")
                    }
                }
            }
        }
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
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(iconBackground)
                    .frame(width: 46, height: 46)

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
            .amountBadgeStyle(color: amountColor)
        }
        .padding(.vertical, 6)
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

struct SummaryCardView: View {
    let totalAmount: Double
    let itemsCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Overview")
                .sectionTitleStyle()

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Total")
                        .smallLabelStyle()

                    Text(
                        totalAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .font(.title2.bold())
                    .foregroundStyle(.primary)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Items")
                        .smallLabelStyle()

                    Text("\(itemsCount)")
                        .font(.title3.bold())
                }
            }
        }
        .glassCardStyle()
        .padding(.horizontal)
    }
}

struct SectionHeaderView: View {
    let title: String
    let systemImage: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: systemImage)
            Text(title)
        }
        .font(.headline)
        .foregroundStyle(.white.opacity(0.95))
        .textCase(nil)
    }
}

#Preview {
    ContentView()
}
