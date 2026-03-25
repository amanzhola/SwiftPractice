//
//  AddView.swift
//  iExpense(updated_2)
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
        ZStack {
            AppBackgroundView()

            Form {
                Section("Expense Details") {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) { type in
                            Text(type)
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
                        .foregroundStyle(amountPreviewColor)
                    }
                }
            }
            .scrollContentBackground(.hidden)
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

    var amountPreviewColor: Color {
        if amount < 10 {
            return .green
        } else if amount < 100 {
            return .orange
        } else {
            return .red
        }
    }
}

#Preview {
    NavigationStack {
        AddView(expenses: Expenses())
    }
}
