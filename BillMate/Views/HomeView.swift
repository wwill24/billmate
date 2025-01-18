//
//  HomeView.swift
//  BillMate
//
//  Created by william wu on 1/14/25.
//

import SwiftUI

struct HomeView: View {
    @State private var persons: [String] = [""]
    
    var body: some View {
        VStack {
            Text("Enter Names")
                .font(.headline)
                .padding()

            ForEach(0..<persons.count, id: \.self) { index in
                HStack {
                    TextField("Person \(index + 1)", text: $persons[index])
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        persons.remove(at: index)
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }

            Button(action: {
                persons.append("")
            }) {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.blue)
                    Text("Add Person")
                        .foregroundColor(.blue)
                }
                .padding(.vertical)
            }

            Spacer()
        }
        .padding()
    }
}
