//
//  ContentView.swift
//  BillMate
//
//  Created by william wu on 1/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("Hello! Welcome to BillMate!")
                NavigationLink(destination: LoginView()) {
                    Text("Log In")              .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")              .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {print("Button Tapped")}) {
                    Text("Guest")                .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Text("Log in if you are an existing user")
            
            Text("Don't have an account? Sign up to save your receipts!").multilineTextAlignment(.center)
            NavigationLink(destination: ContentView()) {
                Text("Home")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Text("Log in if you are an existing user")
            
            Text("Don't have an account? Sign up to save your receipts!").multilineTextAlignment(.center)
            NavigationLink(destination: ContentView()) {
                Text("Home")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
