//
//  LoginView.swift
//  Connext
//
//  Created by Scholar on 7/31/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var isSignUp = false
    // Shared
    @State private var email = ""
    @State private var password = ""
    // Sign-Up only
    @State private var name = ""
    @State private var confirmPassword = ""
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text(isSignUp ? "Create Account" : "Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
            if isSignUp {
                TextField("Name", text: $name)
                    .textInputAutocapitalization(.words)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.none)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            if isSignUp {
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
            Button(isSignUp ? "Sign Up" : "Log In") {
                if isSignUp {
                    if !email.isEmpty && password == confirmPassword {
                        isLoggedIn = true
                    }
                } else {
                    if !email.isEmpty && !password.isEmpty {
                        isLoggedIn = true
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(isSignUp ? Color.darkBlue : Color.darkBlue)
            .foregroundColor(.white)
            .cornerRadius(12)
            Button(isSignUp ? "Already have an account? Log In" : "Don't have an account? Sign Up") {
                isSignUp.toggle()
            }
            .foregroundColor(.gray)
            Button("Continue as Guest") {
                isLoggedIn = true
            }
            .font(.footnote)
            .foregroundColor(.gray)
            Spacer()
        }
        .padding()
    }
}
