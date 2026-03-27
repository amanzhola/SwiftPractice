//
//  Student.swift
//  Bookworm
//
//  Created by Amanzhol on 27.03.2026.
//

// Bookworm part one

// Introduction to SwiftData and SwiftUI
import Foundation
import SwiftData

//@Observable
@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
