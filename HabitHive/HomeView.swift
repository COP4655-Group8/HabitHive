import SwiftUI
import FirebaseFirestore

struct HomeView: View {
    @StateObject private var habitManager = HabitManager()
    @State private var isShowingAddHabit = false
    @State private var checkedHabits: [UUID: Bool] = [:] // Dictionary to track check status of habits
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("HabitHive")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 5)

                if habitManager.savedHabits.isEmpty {
                    Text("No habits saved yet!")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(habitManager.savedHabits, id: \.id) { habit in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.description)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("Frequency: \(habit.frequency)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button(action: {
                                // Toggle the check status for this habit
                                checkedHabits[habit.id] = !(checkedHabits[habit.id] ?? false)
                            }) {
                                Image(systemName: checkedHabits[habit.id] == true ? "checkmark.square.fill" : "square")
                                    .foregroundColor(.green)
                                    .font(.title2)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            .navigationBarItems(
                trailing: Button(action: {
                    isShowingAddHabit = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                }
            )
            .sheet(isPresented: $isShowingAddHabit) {
                AddHabitView(habitManager: habitManager)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
