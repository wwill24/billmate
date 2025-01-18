//
//  LandingView.swift
//  BillMate
//
//  Created by william wu on 1/14/25.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Text("BillMate")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom, 42)
                NavigationLink(destination: LoginView()) {
                    Text("Log In")              .padding()
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                }
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")              .padding()
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                }
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                    Text("Guest")                .padding()
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(30)
                }
            }
            .padding()
        }
    }
}
