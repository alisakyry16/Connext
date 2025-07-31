//
//  ProjectViewModel.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//
import Foundation
class ProjectViewModel: ObservableObject {
    @Published var name: String
    @Published var projectName: String
    @Published var topic: String
    @Published var details: String
    @Published var location: String
    @Published var listing: String
    
    init(name: String = "",
         projectName: String = "",
         topic: String = "",
         details: String = "",
         location: String = "",
         listing: String = "") {
        self.name = name
        self.projectName = projectName
        self.topic = topic
        self.details = details
        self.location = location
        self.listing = listing
    }
}






