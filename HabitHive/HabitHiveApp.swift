//
//  HabitHiveApp.swift
//  HabitHive
//
//  Created by Anthony Irizarry on 10/28/24.
//

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
                // We have a logged in user, go to ChatView
                HomeView() // <-- Add ChatView
                    .environment(authManager) // <-- Pass authManager to the environment
            } else {
                // No logged in user, go to LoginView
                LoginView()
                    .environment(authManager)
            }
        }
    }
}
