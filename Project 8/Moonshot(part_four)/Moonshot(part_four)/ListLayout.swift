//
//  ListLayout.swift
//  Moonshot(part_four)
//
//  Created by Amanzhol on 24.03.2026.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]

    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
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
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    return NavigationStack {
        ListLayout(missions: missions, astronauts: astronauts)
            .navigationTitle("Moonshot")
            .background(.darkBackground)
    }
    .preferredColorScheme(.dark)
}

