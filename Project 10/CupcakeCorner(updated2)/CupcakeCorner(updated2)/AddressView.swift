//
//  AddressView.swift
//  CupcakeCorner(updated2)
//
//  Created by Amanzhol on 27.03.2026.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order: Order
    
    var body: some View {
        ZStack {
            AppBackgroundView()
            
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Delivery details")
                            .screenTitleStyle()
                        
                        Text("Enter your delivery address below.")
                            .foregroundStyle(.white.opacity(0.9))
                        
                        Group {
                            TextField("Name", text: $order.name)
                            TextField("Street Address", text: $order.streetAddress)
                            TextField("City", text: $order.city)
                            TextField("Zip", text: $order.zip)
                        }
                        .styledTextField()
                    }
                    .cardStyle()
                    
                    if !order.hasValidAddress {
                        Text("Please fill in all fields. Spaces only are not allowed.")
                            .font(.footnote.weight(.semibold))
                            .foregroundStyle(.red)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                            .frame(maxWidth: .infinity)
                    }
                    .primaryButtonStyle()
                    .disabled(order.hasValidAddress == false)
                }
                .padding()
            }
        }
        .navigationTitle("Address")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
