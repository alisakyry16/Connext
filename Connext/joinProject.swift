//
//  joinProject.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI
struct ProjectCard: View {
  var name: String
  var projectName: String
  var description: String
  var location: String
  var backgroundColor: Color {
      Color.beige
  }
  var body: some View {
    ZStack{
      VStack(alignment: .leading, spacing: 10) {
        HStack {
          Text("NAME")
            .font(.caption)
            .fontWeight(.bold)
          Spacer()
          Text("PROJECT NAME")
            .font(.caption)
            .fontWeight(.bold)
        }
        HStack {
          Text(name)
            .font(.body)
            .lineLimit(2)
          Spacer()
          Text(projectName)
            .font(.body)
        }
        Text(description)
          .font(.body)
          .fixedSize(horizontal: false, vertical: true)
        HStack {
          VStack(alignment: .leading) {
            Text("Team")
              .font(.subheadline)
              .fontWeight(.semibold)
            Image(systemName: "person.3.fill")
          }
          Spacer()
          VStack(alignment: .trailing) {
            HStack(spacing: 4) {
              Text(location)
                .font(.subheadline)
                .fontWeight(.semibold)
              Image(systemName: "mappin.and.ellipse")
            }
            Button(action: {
              // Join project action
            }) {
              Text("Join")
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(Color.purple.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(12)
            }
          }
        }
      }
      .padding()
      .background(Color(red: 172/255, green: 179/255, blue: 230/255))
      .cornerRadius(20)
      .padding(.horizontal)
    }
      
  }
}
struct joinProject: View {
 var projects: [ProjectCardData] = [
  ProjectCardData(name: "Team Alpha", projectName: "AI Assistant", description: "Using machine learning to build a virtual assistant that adapts to user behavior.", location: "Seattle"),
  ProjectCardData(name: "Team Beta", projectName: "Eco App", description: "Track your carbon footprint and earn rewards by reducing waste.", location: "New York"),
  ProjectCardData(name: "Team Gamma", projectName: "Art Exchange", description: "A community for young artists to share and sell digital artwork.", location: "San Francisco")
 ]
  var body: some View {
    ZStack{
      Color(.beige)
        .ignoresSafeArea()
      NavigationStack {
        ScrollView {
          VStack(spacing: 20) {
            Text("JOIN A PROJECT")
              .font(.title)
              .fontWeight(.bold)
              .padding(.top)
            ForEach(projects, id: \ .self) { project in
              ProjectCard(name: project.name, projectName: project.projectName, description: project.description, location: project.location)
            }
            Spacer(minLength: 80)
          }
        }
      }
    }
      customToolbar()
  }
}

struct ProjectCardData: Hashable {
 let name: String
 let projectName: String
 let description: String
 let location: String
}
#Preview {
 joinProject()
}
