
import Foundation
//this is called a immutable struct which is the recommended way top build apps
struct ItemModel: Identifiable, Codable {
    let id: String
    var title: String
    let isCompleted: Bool
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    mutating func updateTitle(newTitle: String) {
        title = newTitle
    }
func updateCompletion() -> ItemModel {
    return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
