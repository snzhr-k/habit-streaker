import Foundation
import SwiftData

@Model
final class Habit{
    var id = UUID()
    var name: String
    var createdAt: Date
    var doneOn: [HabitLog]
    
    init(name: String = "untitled"){
        self.name = name
        self.createdAt = .now
        self.doneOn = []
    }
    
}

@Model
final class HabitLog {
    var date: Date
    var isDone: Bool
    var habit: Habit?
    
    init(habit: Habit, isDone: Bool = false, date: Date = Date()){
        self.date = date
        self.isDone = isDone
        self.habit = habit
    }
}
