import Foundation
import SwiftData

@Model
final class Habit {
    var id = UUID()
    var name: String
    var createdAt: Date
    var doneOn: [HabitLog]
    
    // Computed property for weekChunks derived from doneOn; adjust chunk size as needed.
    // If you prefer to store this, change it back to a stored var and manage persistence/mutations accordingly.
    var weekChunks: [[HabitLog]] {
        doneOn.chunks(of: 7)
    }
    
    init(name: String = "untitled") {
        self.name = name
        self.createdAt = .now
        self.doneOn = []
    }
    
    func isDone(on date: Date) -> Bool {
        doneOn.contains(where: { Calendar.current.isDate($0.date, inSameDayAs: date) && $0.isDone })
    }
    
    // Returns chunked segments of the habit's logs based on the provided size.
    func getMapChunk(of size: Int) -> [[HabitLog]] {
        doneOn.chunks(of: size)
    }
}

// Array extension must be at file scope, not nested inside Habit.
extension Array {
    func chunks(of size: Int) -> [[Element]] {
        guard size > 0 else { return [] }
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

@Model
final class HabitLog: Hashable {
    var date: Date
    var isDone: Bool
    var habit: Habit?
    
    init(habit: Habit, isDone: Bool = false, date: Date = Date()) {
        self.date = date
        self.isDone = isDone
        self.habit = habit
    }
    
    // Conformance to Hashable to allow ForEach(id: \.self) usage in SwiftUI
    static func == (lhs: HabitLog, rhs: HabitLog) -> Bool {
        lhs.date == rhs.date && lhs.isDone == rhs.isDone && lhs.habit?.id == rhs.habit?.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(date)
        hasher.combine(isDone)
        hasher.combine(habit?.id)
    }
}
