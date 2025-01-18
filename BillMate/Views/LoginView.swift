//
//  LoginView.swift
//  BillMate
//
//  Created by william wu on 1/14/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            Text("Welcome Back!")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.bottom, 42)
            InputFieldView(data: $email, title: "Email")
            InputFieldView(data: $password, title: "Password")
            Button(action: {}) {
                Text("Sign In")
                .fontWeight(.heavy)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
            }
        }
    }
}

