//
//  ContentView.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI
import SwiftData

struct ProgressRing: View {
  var progress: CGFloat // between 0.0 and 1.0
  var lineWidth: CGFloat = 45
  var size: CGFloat = 200
var body: some View {
  ZStack {
    Circle()
      .stroke(Color.lightBlue.opacity(0.3), lineWidth: lineWidth)
    Circle()
      .trim(from: 0.0, to: progress)
      .stroke(Color.darkBlue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
      .rotationEffect(.degrees(-90))
    Text("\(Int(progress * 100))%")
      .font(.title)
      .fontWeight(.bold)
      .foregroundColor(.black)
    }
    .frame(width: size, height: size)
  }
}



struct ContentView: View {
  @Query var toDos: [ToDoItem]
  @State private var projects: [ProjectViewModel] = []
  @State private var selectedIndex: Int? = nil
  @Environment(\.presentationMode) var presentationMode
  @State private var task1 = ""
  @State private var task2 = ""
  @State private var task3 = ""
  @State private var projectToEdit: ProjectViewModel? = nil
  @State private var navigateBack = false
  var progress: CGFloat {
    guard !toDos.isEmpty else { return 0 }
    let completed = toDos.filter { $0.isDone }.count
    return CGFloat(completed) / CGFloat(toDos.count)
  }
  var body: some View {
    NavigationStack {
      ZStack {
        Color(.beige).ignoresSafeArea()
        VStack {
          if let selected = selectedIndex {
            HStack {
              Text(projects[selected].projectName.isEmpty ? "Untitled" : projects[selected].projectName)
                .font(.largeTitle)
                .fontWeight(.bold)
              Spacer()
            }
            HStack {
              Button("Edit Details") {
                projectToEdit = projects[selected]
              }
              .font(.headline)
              .fontWeight(.semibold)
              .foregroundColor(.lightBlue)
              Spacer()
            }
            Spacer()
            ProgressRing(progress: progress)
            Spacer()
            HStack {
              Text("Next Steps")
                .font(.title)
                .fontWeight(.bold)
              Spacer()
            }
            let nextSteps = toDos.filter { !$0.isDone }.suffix(3).reversed()
            ForEach(nextSteps, id: \.self) { task in
              Text(task.title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(width: 350, height: 50)
                .background(Rectangle().foregroundColor(.darkBlue))
                .cornerRadius(20)
                .padding(3.0)
            }
          } else {
              HStack {
                Text("No Project Selected")
                  .font(.largeTitle)
                  .fontWeight(.bold)
                Spacer()
              }
              Spacer()
              ProgressRing(progress: progress)
              Spacer()
              HStack {
                Text("Next Steps")
                  .font(.title)
                  .fontWeight(.bold)
                Spacer()
              }
          }
        }
        .padding()
        .navigationDestination(isPresented: Binding<Bool>(
          get: { projectToEdit != nil },
          set: {
            if !$0 {
              if let project = projectToEdit {
                if let index = projects.firstIndex(where: { $0 === project }) {
                  selectedIndex = index
                } else {
                  projects.append(project)
                  DispatchQueue.main.async {
                    selectedIndex = projects.count - 1
                  }
                }
              }
              projectToEdit = nil
            }
          }
        )) {
          if let project = projectToEdit {
            createProject(project: project)
          }
        }
      }
      .toolbar {
        ToolbarItem(placement: .principal) {
          if let selectedIndex = selectedIndex {
            Menu {
              ForEach(projects.indices, id: \.self) { index in
                Button(projects[index].projectName.isEmpty ? "Untitled" : projects[index].projectName) {
                  self.selectedIndex = index
                }
              }
              Divider()
              Button {
                let newProject = ProjectViewModel()
                projects.append(newProject)
//                DispatchQueue.main.async {
//                  selectedIndex = projects.count - 1
//                }
                projectToEdit = newProject
              } label: {
                Label("Create New Project", systemImage: "plus")
              }
            } label: {
              HStack(spacing: 4) {
                Text(projects[selectedIndex].projectName.isEmpty ? "Untitled Project" : projects[selectedIndex].projectName)
                  .font(.headline)
                  .fontWeight(.semibold)
                  .foregroundColor(.primary)
                Image(systemName: "chevron.down")
                  .font(.subheadline)
                  .foregroundColor(.gray)
              }
            }
          } else {
            Text("No Project Selected")
              .font(.headline)
              .foregroundColor(.gray)
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            let newProject = ProjectViewModel()
            projects.append(newProject)
            DispatchQueue.main.async {
              selectedIndex = projects.count - 1
            }
            projectToEdit = newProject
          }) {
            Image(systemName: "plus")
              .font(.title2)
          }
        }
      }
      .navigationBarBackButtonHidden(true)
        customToolbar()
    }
  }
}
#Preview {
  ContentView()
    .modelContainer(for: ToDoItem.self, inMemory: true)
}
