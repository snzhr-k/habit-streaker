//
//  Habit_StreakerApp.swift
//  Habit Streaker
//
//  Created by snzhrk on 13.09.2025.
//

import SwiftUI
import SwiftData

@main
struct Habit_StreakerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Habit.self, HabitLog.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
        
    
    var body: some Scene {
        WindowGroup {
            HabitListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
