//
//  ListLayout.swift
//  Moonshot(updated)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]

    var body: some View {
        List(missions) { mission in
            NavigationLink(value: mission) {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .foregroundStyle(.white)

                        Text(mission.formattedLaunchDate)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return NavigationStack {
        ListLayout(missions: missions)
            .navigationTitle("Moonshot")
            .background(.darkBackground)
    }
    .preferredColorScheme(.dark)
}
