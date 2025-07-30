import SwiftUI

struct ContentView: View {
    // Example list of projects with IDs
    @State private var projects: [ProjectViewModel] = [
        ProjectViewModel(id: UUID(), projectName: "Project A"),
        ProjectViewModel(id: UUID(), projectName: "Project B")
    ]
    
    @State private var selectedProjectID: UUID? = nil
    
    var body: some View {
        NavigationStack {
            List(projects, id: \.id) { project in
                NavigationLink(destination: toDo(projectID: project.id)) {
                    Text(project.projectName.isEmpty ? "Untitled Project" : project.projectName)
                }
            }
            .navigationTitle("Projects")
        }
    }
}

// Your ProjectViewModel simplified for example:
class ProjectViewModel: ObservableObject, Identifiable {
    let id: UUID
    @Published var projectName: String
    
    init(id: UUID = UUID(), projectName: String = "") {
        self.id = id
        self.projectName = projectName
    }
}

#Preview {
    ContentView()
}
