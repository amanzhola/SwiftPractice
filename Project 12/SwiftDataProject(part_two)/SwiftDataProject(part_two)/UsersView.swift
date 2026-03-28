//
//  UsersView.swift
//  SwiftDataProject(part_two)
//
//  Created by Amanzhol on 28.03.2026.
//

// +Dinamically sorting and filtering @Query with SwiftUI

import SwiftData
import SwiftUI

struct UsersView: View {
    
    // testing perpose ->
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            // +Relatiionships with SwiftData, SwiftUI, and @Query
            HStack {
                Text(user.name)
                
                Spacer()
                
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJointDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJointDate
        }, sort: sortOrder)
    }
    
    // +Relatiionships with SwiftData, SwiftUI, and @Query
    func addSample() {
        let user1 = User(name: "Pipper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(user1)
        
        user1.jobs.append(job1)
        user1.jobs.append(job2)
    }
}

#Preview {
    UsersView(minimumJointDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}
