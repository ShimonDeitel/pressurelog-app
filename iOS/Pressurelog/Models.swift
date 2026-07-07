import Foundation

struct CookLog: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    var dish: String
    var pressureLevel: String
    var cookTimeMinutes: Int
    var notes: String

    init(id: UUID = UUID(), dish: String = "", pressureLevel: String = "", cookTimeMinutes: Int = 0, notes: String = "") {
        self.id = id
        self.dish = dish
        self.pressureLevel = pressureLevel
        self.cookTimeMinutes = cookTimeMinutes
        self.notes = notes
    }
}
