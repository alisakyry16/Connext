//
// NewToDoView.swift
// ToDoList
//
// Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Binding var showNewTask: Bool
    @State private var title: String = ""
    @State private var isImportant: Bool = false
    
    let projectID: UUID  // receive projectID from parent
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            Text("Task title:")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("Enter the task description...", text: $title)
                .padding()
                .background(Color(.beige))
                .cornerRadius(15)
                .padding()
            
            Toggle(isOn: $isImportant) {
                Text("Is it important?")
            }
            .padding()
            
            Button {
                addToDo()
                showNewTask = false
            } label: {
                Text("Save")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
            .padding()
        }
        .background(Color(.beige).ignoresSafeArea())
        .padding()
    }
    
    func addToDo() {
        let newToDo = ToDoItem(title: title, isImportant: isImportant, projectID: projectID)
        modelContext.insert(newToDo)
        try? modelContext.save()
    }
}

#Preview {
    NewToDoView(showNewTask: .constant(true), projectID: UUID())
}
