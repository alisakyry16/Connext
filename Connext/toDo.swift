//
//  toDo.swift
//  ToDoList
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct toDo: View {
    let projectID: UUID

    @Query private var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    @State private var showNewTask = false

    // Custom initializer to filter ToDos by projectID
    init(projectID: UUID) {
        self.projectID = projectID
        _toDos = Query(filter: #Predicate<ToDoItem> { $0.projectID == projectID })
    }

    var body: some View {
        ZStack {
            Color(.beige).ignoresSafeArea()

            VStack {
                HStack {
                    Text("To Do List")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    Button {
                        withAnimation {
                            showNewTask = true
                        }
                    } label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
                .padding()

                Spacer()

                List {
                    ForEach(toDos) { toDoItem in
                        HStack {
                            Button {
                                toggleDone(toDoItem)
                            } label: {
                                Image(systemName: toDoItem.isDone ? "checkmark.square.fill" : "square")
                                    .foregroundColor(toDoItem.isDone ? .gray : .blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            Text(toDoItem.title)
                                .foregroundColor(toDoItem.isDone ? .gray : .primary)
                                .strikethrough(toDoItem.isDone)

                            if toDoItem.isImportant {
                                Spacer()
                                Image(systemName: "exclamationmark.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .onDelete(perform: deleteToDo)
                }
                .listStyle(.plain)
                .background(Color.beige)
            }

            if showNewTask {
                NewToDoView(
                    showNewTask: $showNewTask,
                    toDoItem: ToDoItem(title: "", isImportant: false, projectID: projectID),
                    projectID: projectID
                )
            }
        }
        .animation(.default, value: toDos.count)
        .animation(.default, value: showNewTask)
        customToolbar()
    }

    // MARK: - Helpers
    
    func toggleDone(_ toDoItem: ToDoItem) {
        toDoItem.isDone.toggle()
        try? modelContext.save()
    }

    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
        try? modelContext.save()
    }
}

#Preview {
    toDo(projectID: UUID())
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
