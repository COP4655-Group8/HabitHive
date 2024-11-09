import SwiftUI

struct HomeView: View {
    @State private var selection = 1
    
    @Environment(AuthManager.self) var authManager
    //authManager.signOut() to sign out
    
    var body: some View {
        Text("HabitHive")
        
        Button("Sign Out"){
            authManager.signOut()
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing)
        
        
        
        Spacer()
        
    }
}

#Preview {
    HomeView()
        .environment(AuthManager())
}

