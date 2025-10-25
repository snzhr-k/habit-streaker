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
    
    var chunkedDates: [[HabitLog]] = habit.getMapChunk(of: 10)
    var habitBoxSize: CGFloat = 10.0
    
    ScrollView(.vertical){
        VStack(alignment: .leading){
            ForEach(chunkedDates, id: \.self){row in
                HStack{
                    ForEach(row, id: \.self){log in
                        Rectangle()
                            .frame(width: habitBoxSize, height: habitBoxSize)
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}
