//
// ToDoListApp.swift
// ToDoList
//
// Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

//@main
struct ToDoList: App {
    var body: some Scene {
        WindowGroup {
            // Use a fixed UUID or pass a real project UUID here:
            let sampleProjectID = UUID() // replace with your real project ID from elsewhere
            toDo(projectID: sampleProjectID)
                .modelContainer(for: ToDoItem.self)
        }
    }
}
