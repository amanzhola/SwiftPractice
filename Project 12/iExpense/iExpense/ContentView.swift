//
//  ContentView.swift
//  iExpense
//
//  Created by Amanzhol on 29.03.2026.
//

import SwiftUI
import SwiftData

enum ExpenseType: String, CaseIterable, Identifiable {
    case personal = "Personal"
    case business = "Business"

    var id: String { rawValue }
    var title: String { rawValue }
}

enum ExpenseFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case personal = "Personal"
    case business = "Business"

    var id: String { rawValue }
    var title: String { rawValue }
}

enum ExpenseSortOrder: String, CaseIterable, Identifiable {
    case name = "Name"
    case amount = "Amount"

    var id: String { rawValue }
    var title: String { rawValue }
}

@Model
final class ExpenseItem {
    var name: String
    var type: String
    var amount: Double

    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \ExpenseItem.name) private var expenses: [ExpenseItem]

    @State private var sortOrder = ExpenseSortOrder.name
    @State private var filter = ExpenseFilter.all

    var filteredAndSortedExpenses: [ExpenseItem] {
        let filtered: [ExpenseItem]

        switch filter {
        case .all:
            filtered = expenses
        case .personal:
            filtered = expenses.filter { $0.type == ExpenseType.personal.rawValue }
        case .business:
            filtered = expenses.filter { $0.type == ExpenseType.business.rawValue }
        }

        switch sortOrder {
        case .name:
            return filtered.sorted {
                $0.name.localizedStandardCompare($1.name) == .orderedAscending
            }
        case .amount:
            return filtered.sorted { $0.amount > $1.amount }
        }
    }

    var totalAmount: Double {
        filteredAndSortedExpenses.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()

                List {
                    if filteredAndSortedExpenses.isEmpty {
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
                                itemsCount: filteredAndSortedExpenses.count
                            )
                            .listRowInsets(
                                EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
                            )
                            .listRowBackground(Color.clear)
                        }

                        Section {
                            ForEach(filteredAndSortedExpenses) { item in
                                ExpenseRow(item: item)
                            }
                            .onDelete(perform: removeItems)
                        } header: {
                            SectionHeaderView(
                                title: sectionTitle,
                                systemImage: sectionImage
                            )
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .listStyle(.insetGrouped)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if !filteredAndSortedExpenses.isEmpty {
                        EditButton()
                    }
                }

                ToolbarItem(placement: .principal) {
                    Menu {
                        Section("Sort By") {
                            Picker("Sort By", selection: $sortOrder) {
                                ForEach(ExpenseSortOrder.allCases) { option in
                                    Text(option.title).tag(option)
                                }
                            }
                        }

                        Section("Filter") {
                            Picker("Filter", selection: $filter) {
                                ForEach(ExpenseFilter.allCases) { option in
                                    Text(option.title).tag(option)
                                }
                            }
                        }
                    } label: {
                        Label("Options", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let item = filteredAndSortedExpenses[index]
            modelContext.delete(item)
        }
    }

    var sectionTitle: String {
        switch filter {
        case .all:
            return "All Expenses"
        case .personal:
            return "Personal"
        case .business:
            return "Business"
        }
    }

    var sectionImage: String {
        switch filter {
        case .all:
            return "list.bullet.rectangle"
        case .personal:
            return "person.fill"
        case .business:
            return "briefcase.fill"
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

                Image(systemName: item.type == ExpenseType.personal.rawValue ? "person.fill" : "briefcase.fill")
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
        item.type == ExpenseType.personal.rawValue ? .blue : .purple
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
        .modelContainer(for: ExpenseItem.self, inMemory: true)
}
