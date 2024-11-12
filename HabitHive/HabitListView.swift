import SwiftUI

struct HabitListView: View {
    
    @State var habitManager: HabitManager
    
    init(isMocked: Bool = false){
        habitManager = HabitManager(isMocked: isMocked)
    }
    
    var body: some View {
        Text("Habit List")
        Spacer()
        List {
            ForEach(habitManager.savedHabits, id: \.self) { habit in
                Text(habit.description)
                }
        }
        Spacer()
    }
}

#Preview {
    HabitListView(isMocked: true)
}
