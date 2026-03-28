//
//  User.swift
//  SwiftDataProject(part_two)
//
//  Created by Amanzhol on 28.03.2026.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    // +Relatiionships with SwiftData, SwiftUI, and @Query
//    var jobs = [Job]()
    @Relationship(deleteRule: .cascade) var jobs = [Job]()
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
    
}
