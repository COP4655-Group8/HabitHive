import SwiftUI
import FirebaseCore

@main
struct HabitHiveApp: App {
    
    @State private var authManager: AuthManager

    init() {
        FirebaseApp.configure()
        authManager = AuthManager()
    }
    
    var body: some Scene {
        WindowGroup {
            if authManager.user != nil {
                ContentView()
                    .environment(authManager)
            } else {
                LoginView()
                    .environment(authManager)
            }
        }
    }
}
