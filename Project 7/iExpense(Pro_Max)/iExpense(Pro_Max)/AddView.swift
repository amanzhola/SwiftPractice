//
//  AddView.swift
//  iExpense(Pro_Max)
//
//  Created by Amanzhol on 23.03.2026.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var type = "Personal"
    @State private var category = "Food"
    @State private var amount = 0.0
    @State private var date = Date()
    @State private var note = ""

    var expenses: Expenses

    let types = ["Business", "Personal"]
    let categories = [
        "Food",
        "Transport",
        "Shopping",
        "Bills",
        "Work",
        "Health",
        "Entertainment",
        "Other"
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section("Expense Info") {
                    TextField("Name", text: $name)

                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
                        }
                    }

                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { category in
                            Label(category, systemImage: icon(for: category))
                                .tag(category)
                        }
                    }

                    DatePicker("Date", selection: $date, displayedComponents: .date)

                    TextField(
                        "Amount",
                        value: $amount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .keyboardType(.decimalPad)
                }

                Section("Note") {
                    TextField("Optional note", text: $note, axis: .vertical)
                        .lineLimit(3...5)
                }

                Section("Preview") {
                    HStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(previewColor.opacity(0.15))
                                .frame(width: 44, height: 44)

                            Image(systemName: icon(for: category))
                                .foregroundStyle(previewColor)
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            Text(name.isEmpty ? "Expense name" : name)
                                .font(.headline)

                            Text("\(type) • \(category)")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        Text(amount.currencyString)
                            .font(.headline)
                            .foregroundStyle(previewColor)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let item = ExpenseItem(
                            name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                            type: type,
                            category: category,
                            amount: amount,
                            date: date,
                            note: note.trimmingCharacters(in: .whitespacesAndNewlines)
                        )

                        expenses.items.append(item)
                        dismiss()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || amount <= 0)
                }
            }
        }
    }

    var previewColor: Color {
        if amount < 10 {
            return .green
        } else if amount < 100 {
            return .orange
        } else {
            return .red
        }
    }

    func icon(for category: String) -> String {
        switch category {
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

#Preview {
    AddView(expenses: Expenses())
}
