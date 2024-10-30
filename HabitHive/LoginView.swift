//
//  LoginView.swift
//  HabitHive
//
//  Created by Anthony Irizarry on 10/29/24.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(AuthManager.self) var authManager
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
        Spacer()
        
        Text("HabitHive")
            .font(.title)
            .fontWeight(.bold)
            .padding()
        
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
        }
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.never)
        .padding()
        
        VStack {
            NavigationLink(destination: RegisterView()){
                Text("Register")
                    .frame(maxWidth: .infinity)
            }
            
            Button {
                print("Login user: \(email), \(password)")
                
                authManager.signIn(email: email, password: password)
                 
                print(authManager.user ?? "nil")
                
                
            } label: {
                Text("Login")
                    .frame(maxWidth: UIScreen.main.bounds.size.width / 2, maxHeight: 30)
            }
            .buttonStyle(.borderedProminent)
        }
        Spacer()
    }
    }
}

#Preview {
    LoginView()
        .environment(AuthManager())
}
