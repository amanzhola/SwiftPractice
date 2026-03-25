//
//  AddView.swift
//  iExpense(updated)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = "New Expense"
    @State private var type = "Personal"
    @State private var amount = 0.0

    var expenses: Expenses

    let types = ["Business", "Personal"]

    var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        Form {
            Section("Expense Details") {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField(
                    "Amount",
                    value: $amount,
                    format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                )
                .keyboardType(.decimalPad)
            }

            Section {
                HStack {
                    Text("Preview")
                        .foregroundStyle(.secondary)

                    Spacer()

                    Text(
                        amount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                    )
                    .font(.headline)
                }
            }
        }
        .navigationTitle($name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let item = ExpenseItem(name: trimmedName, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
                .disabled(trimmedName.isEmpty || amount <= 0)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddView(expenses: Expenses())
    }
}
