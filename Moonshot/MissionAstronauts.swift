//
//  MissionAstronauts.swift
//  Moonshot
//
//  Created by Cesar Lopez on 3/23/23.
//

import SwiftUI

struct MissionAstronauts: View {
    let crew: [Mission.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                    
                }
            }
        }
    }
}
//
//struct MissionAstronauts_Previews: PreviewProvider {
//    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//    let missions: [Mission] = Bundle.main.decode("missions.json")
//
//    var crewMembers: [Mission.CrewMember] { missions[0].crew.map { member in
//        if let astronaut = astronauts[member.name] {
//            return Mission.CrewMember(role: member.role, astronaut: astronaut)
//        } else {
//            fatalError("Missing \(member.name)")
//        }
//    }}
//
//    static var previews: some View {
//        MissionAstronauts(crew: crewMembers)
//    }
//}
