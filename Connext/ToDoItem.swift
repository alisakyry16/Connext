import Foundation
import SwiftData

@Model
final class ToDoItem {
    var title: String
    var isImportant: Bool
    var isDone: Bool = false
    var projectID: UUID  // no default value here

    init(title: String, isImportant: Bool, projectID: UUID) {
        self.title = title
        self.isImportant = isImportant
        self.projectID = projectID
    }
}
