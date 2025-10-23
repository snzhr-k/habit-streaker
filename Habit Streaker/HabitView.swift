import SwiftUI

struct HabitView: View{
    
    
    var body: some View{
        NavigationStack{
            Form{
                Section{
                    
                }
                
                Section{
                    
                }
            }
        }.navigationTitle(<#T##title: Text##Text#>)
    }
    
    
    
}

@ViewBuilder
func getHabitMap(habit: Habit) -> View{
    var body: any View{
        NavigationStack{
            Form{
                Section{
                    //habit map view
                }
                
                Section{
                    //description fot the habit
                    //for how many days
                    //since when started
                    //current sctreak
                }
            }
        }.navigationTitle(Text(habit.name))
    }
    
    return body
}
