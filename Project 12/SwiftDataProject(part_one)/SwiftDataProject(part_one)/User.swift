//
//  User.swift
//  SwiftDataProject(part_one)
//
//  Created by Amanzhol on 28.03.2026.
//

// +Filtering @Query using Predicate
// +Editing SwiftData model objects

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
    
}
