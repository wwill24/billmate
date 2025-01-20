//
//  SortingView.swift
//  BillMate
//
//  Created by william wu on 1/17/25.
//

import SwiftUI

struct SortingView: View {
    @Binding var persons: [String]
    @Binding var dishes: [(String, Int)]
    var body: some View {
        VStack{
            Text("Sort")
            Button(action: {
                
            }) {
                
            }
            Button(action: {
                print(persons)
            }) {
                Text("Print persons")
            }
        }
    }
}
