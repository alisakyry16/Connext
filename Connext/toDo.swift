//
//  ContentView.swift
//  ToDoList
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct toDo: View {
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    @State private var showNewTask = false

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
                        if toDoItem.isImportant {
                            Text("‼️ " + toDoItem.title)
                        } else {
                            Text(toDoItem.title)
                        }
                    }
                    .onDelete(perform: deleteToDo)
                }
                .listStyle(.plain)
                .background(Color.clear)
            }
            
            if showNewTask {
                NewToDoView(showNewTask: $showNewTask, toDoItem: ToDoItem(title: "", isImportant: false))
            }
        }
    }
    
    // ✅ Moved OUTSIDE body
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    toDo()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}
