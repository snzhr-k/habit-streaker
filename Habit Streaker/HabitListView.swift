import SwiftUI
import SwiftData

struct HabitListView: View{
    @Environment(\.modelContext) private var modelContext
    @Query private var Habits: [Habit]
    
    var body: some View{
        
        NavigationStack{
            List{
                ForEach(Habits){habit in
                    NavigationLink(destination: HabitView(habit: habit)){
                        HabitRowButton(habit: habit)
                    }
                }.onDelete(perform: deleteHabit)
            }.listRowSeparator(.hidden)
                .navigationTitle(Text(Date.now, format: .dateTime.day().month().year()).font(.headline).fontWeight(.bold))
                .scrollContentBackground(.hidden)   // remove list background
                .listRowBackground(Color.clear)     // clear per-row background
                .listRowSpacing(10)
                .background(.gray)
                .listStyle(.plain)
                .foregroundStyle(.pink)
                .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addHabit) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }.contentMargins(.horizontal, 16).padding()

        } //detail: { Text("select an item")}
    }
    
    private func deleteHabit(indices: IndexSet){
        for indice in indices{
            withAnimation{
                modelContext.delete(Habits[indice])
            }
        }
    }
    
    private func addHabit(){
        withAnimation{
            let newHabit = Habit()
            modelContext.insert(newHabit)
        }
    }
}

struct HabitRowButton: View{
    var habit: Habit
    
    var body: some View{
        HStack{
            Text(habit.name).background(Color(.systemGray6))
        }
    }
}

#Preview {
    HabitListView().modelContainer(for: Habit.self, inMemory: true)
}
