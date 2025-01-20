//
//  BillView.swift
//  BillMate
//
//  View that allows user to enter dishes manually or will
//  automatically fill it in with the OCR
//
//  Created by william wu on 1/18/25.
//

import SwiftUI

struct BillView: View {
    @State var dishes: [(String, Int)] = []
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Enter Dish and Price")
                    .font(.headline)
                    .padding()
                
                ForEach(0..<dishes.count, id: \.self) { index in
                    HStack {
                        TextField("Dish \(index + 1)", text: Binding(
                            get: { dishes[index].0 },
                            set: { dishes[index].0 = $0 }
                        ))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        
                        HStack {
                            Text("$")
                                .foregroundColor(.gray)
                            TextField("Amount", value: Binding(
                                get: { dishes[index].1 },
                                set: { dishes[index].1 = $0 }
                            ), formatter: NumberFormatter())
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                        }
                        .padding(.horizontal)

                        Button(action: {
                            dishes.remove(at: index)
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                
                Button(action: {
                    dishes.append(("", 0)) // Add a new empty dish
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                        Text("Add Dish")
                            .foregroundColor(.blue)
                    }
                    .padding(.vertical)
                }
            }
            
            NavigationLink(destination:
                            AddPersonView(dishes: $dishes)
            ) {
                Text("Next")
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

struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView()
            .previewDevice("iPhone 16 Pro")
    }
}
