import SwiftUI

struct ContentView: View {
    @Environment(AuthManager.self) var authManager
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            NavigationStack {
                HabitListView()
            }
                .tabItem{
                    Label("Habits", systemImage: "list.clipboard")
                }
            NavigationStack {
                ShopView()
            }
                .tabItem{
                    Label("Shop", systemImage:"dollarsign.circle")
                }
            
            NavigationStack {
                AchievementsView()
            }
                .tabItem{
                    Label("Achievements", systemImage:"medal.star")
                }
            }
    }
}

#Preview {
    ContentView()
        .environment(AuthManager())
}
