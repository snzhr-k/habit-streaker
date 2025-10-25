import SwiftUI

struct HabitView: View{
    @Bindable var habit: Habit
    
    var body: some View{
        NavigationStack{
            getHabitMap(habit: habit)
        }.navigationTitle(habit.name)
    }
    
    
    
}

@ViewBuilder
func getHabitMap(habit: Habit) -> some View{
    Form{
        Section{
            //habit map view
            Text(habit.createdAt.description)
        }
        
        Section{
            //description fot the habit
            //for how many days
            //since when started
            //current sctreak
            Text(habit.name)
        }
    }
}
