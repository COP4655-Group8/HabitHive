import SwiftUI

import SwiftUI

struct HomeView: View {
    @Environment(AuthManager.self) var authManager
    @StateObject private var habitManager = HabitManager()
    @State private var isShowingAddHabit = false
    @State private var checkedHabits: [String: Bool] = [:]
    
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
                                checkedHabits[habit.id] = !(checkedHabits[habit.id] ?? false)
                                if checkedHabits[habit.id] == true {
                                    habitManager.updateHabitCompletion(habit)
                                }
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
            .onAppear {
                habitManager.getSavedHabits()
            }
            .navigationBarItems(
                leading: Button(action: {
                    authManager.signOut() // Call the signOut method
                }) {
                    Text("Logout")
                        .foregroundColor(.blue) // Make the text blue
                        .fontWeight(.bold)
                },
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
