//
//  DeliveryReviewView.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import SwiftUI

struct DeliveryReviewView: View {
    
    var userAddress: String = ""
    
    // Ignore this, used for TextArea auto focus
    @FocusState private var isFocused: Bool
    
    var body: some View {
        Group {
            TextField("", text: $userAddress)
                .padding()
                .textFieldStyle(.roundedBorder)
                .focused($isFocused)
            
            
            NavigationLink {
                CompleteOrderSummaryView()
            } label: {
                Text("Order Summary")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    
            }
            .background(Color.blue)
            .padding(.vertical)
        }
        .navigationTitle("Review Address")
        .onAppear {
            isFocused = true
        }
    }
}
