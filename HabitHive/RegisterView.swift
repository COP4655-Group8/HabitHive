//
//  RegisterView.swift
//  HabitHive
//
//  Created by Anthony Irizarry on 10/29/24.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(AuthManager.self) var authManager
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Text("Register")
            .font(.title)
            .fontWeight(.bold)
        
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
        }
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.never)
        .padding()
        
        Button {
            print("Sign up user: \(email), \(password)")
            authManager.signUp(email: email, password: password)
            
        } label: {
            Text("Sign Up")
                .frame(maxWidth: UIScreen.main.bounds.size.width / 2, maxHeight: 30)
        }
        .buttonStyle(.borderedProminent)
        .textFieldStyle(.roundedBorder)
        .textInputAutocapitalization(.never)
        .padding()
    }
}

#Preview {
    RegisterView()
        .environment(AuthManager())
}
