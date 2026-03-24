//
//  CrewScrollView.swift
//  Moonshot(part_four)
//
//  Created by Amanzhol on 24.03.2026.
//

import SwiftUI

struct CrewScrollView: View {
    let crew: [MissionView.CrewMember]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { member in
                    NavigationLink {
                        AstronautView(astronaut: member.astronaut)
                    } label: {
                        HStack {
                            Image(member.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(member.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)

                                Text(member.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let previewCrew = missions[0].crew.compactMap { member in
        if let astronaut = astronauts[member.name] {
            return MissionView.CrewMember(role: member.role, astronaut: astronaut)
        } else {
            return nil
        }
    }

    return NavigationStack {
        CrewScrollView(crew: previewCrew)
            .padding(.vertical)
            .background(.darkBackground)
            .preferredColorScheme(.dark)
    }
}

