import SwiftUI

struct ContentView: View {
    @Environment(AuthManager.self) var authManager
    @StateObject private var habitManager = HabitManager()  // Initialize habitManager here
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()  // Pass habitManager here
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationStack {
                HabitListView(habitManager: habitManager) // Pass habitManager here
            }
            .tabItem {
                Label("Habits", systemImage: "list.clipboard")
            }
            
            NavigationStack {
                ShopView()
            }
            .tabItem {
                Label("Shop", systemImage: "dollarsign.circle")
            }
            
            NavigationStack {
                AchievementsView()
            }
            .tabItem {
                Label("Achievements", systemImage: "medal.star")
            }
        }
        .onAppear {
            habitManager.getSavedHabits()  // Load saved habits when ContentView appears
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthManager())
}
