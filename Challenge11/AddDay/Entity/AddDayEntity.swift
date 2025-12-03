import Foundation
import SwiftData

@Model
class Activity {
    
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var date: Date
    var isDone: Bool
    @Relationship(deleteRule: .cascade)
    var timer:focusRegister = focusRegister()
    
    init(title: String, date: Date = Date(), isDone: Bool = false) {
        self.title = title
        self.date = date
        self.isDone = isDone
    }
}
