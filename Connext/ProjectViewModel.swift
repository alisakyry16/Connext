//
//  ProjectViewModel.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//
import Foundation
class ProjectViewModel: ObservableObject {
    @Published var name = ""
    @Published var projectName = ""
    @Published var topic = ""
    @Published var details = ""
    @Published var location = ""
    @Published var listing = ""
    var isComplete: Bool {
        !name.isEmpty && !projectName.isEmpty
    }
}

