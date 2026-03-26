//
//  ContentView.swift
//  CupcakeCorner(updated2)
//
//  Created by Amanzhol on 27.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppBackgroundView()
                
                Form {
                    Section("Select your cake") {
                        Picker("Select your cake type", selection: $order.type) {
                            ForEach(Order.types.indices, id: \.self) {
                                Text(Order.types[$0])
                            }
                        }
                        
                        Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                    }
                    .listRowBackground(Color.white.opacity(0.18))
                    
                    Section("Special requests") {
                        Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                        
                        if order.specialRequestEnabled {
                            Toggle("Add extra frosting", isOn: $order.extraFrosting)
                            Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.18))
                    
                    Section {
                        NavigationLink {
                            AddressView(order: order)
                        } label: {
                            HStack {
                                Text("Delivery Details")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .listRowBackground(Color.white.opacity(0.18))
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Cupcake Corner")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.pink)
    }
}

#Preview {
    ContentView()
}
