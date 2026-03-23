//
//  ContentView.swift
//  iExpense(Pro_Max)
//
//  Created by Amanzhol on 23.03.2026.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let category: String
    let amount: Double
    let date: Date
    let note: String
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            saveItems()
        }
    }

    private let saveKey = "Items"

    init() {
        loadItems()
    }

    private func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func loadItems() {
        guard let savedItems = UserDefaults.standard.data(forKey: saveKey),
              let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) else {
            items = []
            return
        }

        items = decodedItems
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var selectedFilter: ExpenseFilter = .all

    var filteredItems: [ExpenseItem] {
        switch selectedFilter {
        case .all:
            return expenses.items.sorted(by: { $0.date > $1.date })
        case .personal:
            return expenses.items
                .filter { $0.type == "Personal" }
                .sorted(by: { $0.date > $1.date })
        case .business:
            return expenses.items
                .filter { $0.type == "Business" }
                .sorted(by: { $0.date > $1.date })
        }
    }

    var personalItems: [ExpenseItem] {
        filteredItems.filter { $0.type == "Personal" }
    }

    var businessItems: [ExpenseItem] {
        filteredItems.filter { $0.type == "Business" }
    }

    var totalAmount: Double {
        filteredItems.reduce(0) { $0 + $1.amount }
    }

    var personalTotal: Double {
        personalItems.reduce(0) { $0 + $1.amount }
    }

    var businessTotal: Double {
        businessItems.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.blue.opacity(0.10), .purple.opacity(0.08), .green.opacity(0.06)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                List {
                    Section {
                        summarySection
                            .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                            .listRowBackground(Color.clear)
                    }

                    Section {
                        Picker("Filter", selection: $selectedFilter) {
                            ForEach(ExpenseFilter.allCases) { filter in
                                Text(filter.title).tag(filter)
                            }
                        }
                        .pickerStyle(.segmented)
                    }

                    if filteredItems.isEmpty {
                        Section {
                            ContentUnavailableView(
                                "No Expenses",
                                systemImage: "tray",
                                description: Text("Tap the plus button to add your first expense.")
                            )
                            .frame(maxWidth: .infinity, minHeight: 220)
                        }
                        .listRowBackground(Color.clear)
                    } else {
                        if selectedFilter == .all || selectedFilter == .personal {
                            Section("Personal") {
                                ForEach(personalItems) { item in
                                    ExpenseRow(item: item)
                                }
                                .onDelete { offsets in
                                    removeItems(offsets, from: personalItems)
                                }
                            }
                        }

                        if selectedFilter == .all || selectedFilter == .business {
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
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("iExpense Pro")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !filteredItems.isEmpty {
                        EditButton()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Label("Add Expense", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }

    var summarySection: some View {
        VStack(spacing: 14) {
            HStack(spacing: 12) {
                SummaryCard(
                    title: "Total",
                    value: totalAmount.currencyString,
                    icon: "wallet.pass.fill",
                    accent: .blue
                )

                SummaryCard(
                    title: "Items",
                    value: "\(filteredItems.count)",
                    icon: "list.bullet.rectangle.fill",
                    accent: .purple
                )
            }

            HStack(spacing: 12) {
                SummaryCard(
                    title: "Personal",
                    value: personalTotal.currencyString,
                    icon: "person.fill",
                    accent: .green
                )

                SummaryCard(
                    title: "Business",
                    value: businessTotal.currencyString,
                    icon: "briefcase.fill",
                    accent: .orange
                )
            }
        }
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

enum ExpenseFilter: String, CaseIterable, Identifiable {
    case all
    case personal
    case business

    var id: String { rawValue }

    var title: String {
        switch self {
        case .all: return "All"
        case .personal: return "Personal"
        case .business: return "Business"
        }
    }
}

struct ExpenseRow: View {
    let item: ExpenseItem

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(iconColor.opacity(0.18))
                    .frame(width: 48, height: 48)

                Image(systemName: categoryIcon)
                    .font(.headline)
                    .foregroundStyle(iconColor)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(item.name)
                    .font(.headline)

                HStack(spacing: 8) {
                    Label(item.category, systemImage: "tag.fill")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Text("•")
                        .foregroundStyle(.tertiary)

                    Text(item.date.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                if !item.note.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Text(item.note)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 6) {
                Text(item.amount.currencyString)
                    .font(.headline)
                    .foregroundStyle(amountColor)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(amountColor.opacity(0.12))
                    .clipShape(Capsule())

                Text(item.type)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
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

    var iconColor: Color {
        switch item.type {
        case "Personal": return .blue
        case "Business": return .purple
        default: return .gray
        }
    }

    var categoryIcon: String {
        switch item.category {
        case "Food": return "fork.knife"
        case "Transport": return "car.fill"
        case "Shopping": return "bag.fill"
        case "Bills": return "bolt.fill"
        case "Work": return "laptopcomputer"
        case "Health": return "cross.case.fill"
        case "Entertainment": return "film.fill"
        default: return "creditcard.fill"
        }
    }
}

struct SummaryCard: View {
    let title: String
    let value: String
    let icon: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(accent)

            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.title3.bold())
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension Double {
    var currencyString: String {
        self.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
    }
}

#Preview {
    ContentView()
}
