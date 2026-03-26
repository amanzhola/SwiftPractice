//
//  CheckoutView.swift
//  CupcakeCorner(updated)
//
//  Created by Amanzhol on 26.03.2026.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var isPlacingOrder = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, minHeight: 233)

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()

                    case .failure:
                        ContentUnavailableView("Image failed to load", systemImage: "photo")
                            .frame(maxWidth: .infinity, minHeight: 233)

                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(height: 233)

                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
                .disabled(isPlacingOrder)
            }
            .padding(.bottom)
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }

    func placeOrder() async {
        isPlacingOrder = true
        defer { isPlacingOrder = false }

        guard let encoded = try? JSONEncoder().encode(order) else {
            confirmationMessage = "Failed to encode order."
            showingConfirmation = true
            return
        }

        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, response) = try await URLSession.shared.upload(for: request, from: encoded)

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }

            print(String(data: data, encoding: .utf8) ?? "No response")

            confirmationMessage = "Your order for \(order.quantity)x \(Order.types[order.type].lowercased()) cupcakes is being processed! 🧁"
            showingConfirmation = true

        } catch {
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    confirmationMessage = "No internet connection. Please check your network."
                case .timedOut:
                    confirmationMessage = "The request timed out. Try again."
                default:
                    confirmationMessage = "Network error: \(urlError.localizedDescription)"
                }
            } else {
                confirmationMessage = "Unknown error: \(error.localizedDescription)"
            }

            showingConfirmation = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
