import SwiftUI

struct HabitListView: View {
    @ObservedObject var habitManager: HabitManager  // Receive the habitManager here
    
    var body: some View {
        VStack {
            Text("Habit List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List {
                ForEach(habitManager.savedHabits, id: \.id) { habit in
                    HStack {
                        Text(habit.description)
                        Spacer()
                        Button(action: {
                            habitManager.deleteHabit(habit) // Delete habit from Firestore
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let habit = habitManager.savedHabits[index]
                        habitManager.deleteHabit(habit) // Delete habit on swipe delete
                    }
                })
            }
        }
        .onAppear {
            habitManager.getSavedHabits() // Load habits on appear
        }
    }
}
