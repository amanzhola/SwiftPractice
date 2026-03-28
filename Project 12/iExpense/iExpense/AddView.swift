//
//  AddView.swift
//  iExpense
//
//  Created by Amanzhol on 29.03.2026.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var name = ""
    @State private var type = ExpenseType.personal
    @State private var amount = 0.0

    var trimmedName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var body: some View {
        ZStack {
            AppBackgroundView()

            Form {
                Section("Expense Details") {
                    TextField("Name", text: $name)

                    Picker("Type", selection: $type) {
                        ForEach(ExpenseType.allCases) { expenseType in
                            Text(expenseType.title)
                                .tag(expenseType)
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
        .navigationTitle(trimmedName.isEmpty ? "New Expense" : trimmedName)
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
                    let item = ExpenseItem(
                        name: trimmedName,
                        type: type.rawValue,
                        amount: amount
                    )

                    modelContext.insert(item)
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
        AddView()
    }
    .modelContainer(for: ExpenseItem.self, inMemory: true)
}
