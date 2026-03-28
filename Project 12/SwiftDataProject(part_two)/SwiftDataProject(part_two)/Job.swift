//
//  Job.swift
//  SwiftDataProject(part_two)
//
//  Created by Amanzhol on 28.03.2026.
//

// +Relatiionships with SwiftData, SwiftUI, and @Query
import Foundation
import SwiftData

@Model
class Job {
    var name: String
    var priority: Int
    var owner: User?
    
    init(name: String, priority: Int, owner: User? = nil) {
        self.name = name
        self.priority = priority
        self.owner = owner
    }
}
