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
     toDo()
       .modelContainer(for: ToDoItem.self)
   }
 }
}
