//
//  CheckoutView.swift
//  CupcakeCorner(updated2)
//
//  Created by Amanzhol on 27.03.2026.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
    @State private var alertTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var isPlacingOrder = false
    
    var body: some View {
        ZStack {
            AppBackgroundView()
            
            ScrollView {
                VStack(spacing: 20) {
                    VStack(spacing: 16) {
                        AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(maxWidth: .infinity, minHeight: 220)
                                
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                
                            case .failure:
                                ContentUnavailableView("Image failed to load", systemImage: "photo")
                                    .frame(maxWidth: .infinity, minHeight: 220)
                                
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .frame(height: 220)
                        .clipShape(.rect(cornerRadius: 20))
                        
                        Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                            .font(.title2.bold())
                            .foregroundStyle(.white)
                    }
                    .cardStyle()
                    
                    Button {
                        Task {
                            await placeOrder()
                        }
                    } label: {
                        HStack {
                            if isPlacingOrder {
                                ProgressView()
                            }
                            Text(isPlacingOrder ? "Placing Order..." : "Place Order")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .primaryButtonStyle()
                    .disabled(isPlacingOrder)
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(alertTitle, isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        isPlacingOrder = true
        defer { isPlacingOrder = false }
        
        guard let encoded = try? JSONEncoder().encode(order) else {
            alertTitle = "Error"
            confirmationMessage = "Failed to encode your order."
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
            
            alertTitle = "Thank you!"
            confirmationMessage = "Your order for \(order.quantity)x \(Order.types[order.type].lowercased()) cupcakes is being processed! 🧁"
            showingConfirmation = true
            
        } catch {
            alertTitle = "Checkout failed"
            
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet:
                    confirmationMessage = "No internet connection. Please check your network and try again."
                case .timedOut:
                    confirmationMessage = "The request timed out. Please try again."
                default:
                    confirmationMessage = "Network error: \(urlError.localizedDescription)"
                }
            } else {
                confirmationMessage = "Something went wrong: \(error.localizedDescription)"
            }
            
            showingConfirmation = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
