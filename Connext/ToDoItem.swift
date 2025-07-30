import SwiftData

@Model
final class ToDoItem {
    var title: String
    var isImportant: Bool
    var isDone: Bool = false  // <-- This is essential

    init(title: String, isImportant: Bool) {
        self.title = title
        self.isImportant = isImportant
    }
}
