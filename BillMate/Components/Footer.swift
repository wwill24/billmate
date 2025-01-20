//
//  Footer.swift
//  BillMate
//
//  Created by william wu on 1/17/25.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        VStack {
//            Spacer() // Spacer to accomodate main screen

            HStack {
                Button(action: {
                    print("Home tapped")
                }) {
                    VStack {
                        Image(systemName: "house.fill").colorMultiply(Color.gray)
                        Text("Home")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    print("Camera tapped")
                }) {
                    VStack {
                        Image(systemName: "camera").colorMultiply(Color.gray)
                        Text("Snap Bill")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: {
                    print("Profile tapped")
                }) {
                    VStack {
                        Image(systemName: "person.fill").colorMultiply(Color.gray)
                        Text("Profile")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2)) // Footer bar background
        }
        .edgesIgnoringSafeArea(.bottom) // Extend to the bottom of the screen
    }
}
