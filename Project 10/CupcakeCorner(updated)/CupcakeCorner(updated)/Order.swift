//
//  Order.swift
//  CupcakeCorner(updated)
//
//  Created by Amanzhol on 26.03.2026.
//

import Foundation
import Observation

@Observable
class Order: Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var extraFrosting = false
    var addSprinkles = false

    var name = "" {
        didSet { saveAddress() }
    }

    var streetAddress = "" {
        didSet { saveAddress() }
    }

    var city = "" {
        didSet { saveAddress() }
    }

    var zip = "" {
        didSet { saveAddress() }
    }

    var hasValidAddress: Bool {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedStreet = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedCity = city.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedZip = zip.trimmingCharacters(in: .whitespacesAndNewlines)

        return !trimmedName.isEmpty &&
               !trimmedStreet.isEmpty &&
               !trimmedCity.isEmpty &&
               !trimmedZip.isEmpty
    }

    var cost: Decimal {
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2

        if extraFrosting {
            cost += Decimal(quantity)
        }

        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }

    init() {
        loadAddress()
    }

    private func saveAddress() {
        UserDefaults.standard.set(name, forKey: "Order_name")
        UserDefaults.standard.set(streetAddress, forKey: "Order_streetAddress")
        UserDefaults.standard.set(city, forKey: "Order_city")
        UserDefaults.standard.set(zip, forKey: "Order_zip")
    }

    private func loadAddress() {
        name = UserDefaults.standard.string(forKey: "Order_name") ?? ""
        streetAddress = UserDefaults.standard.string(forKey: "Order_streetAddress") ?? ""
        city = UserDefaults.standard.string(forKey: "Order_city") ?? ""
        zip = UserDefaults.standard.string(forKey: "Order_zip") ?? ""
    }
}
