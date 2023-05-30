//
//  CompleteOrderView.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import SwiftUI

struct CompleteOrderSummaryView: View {
    var order: Order
    var userAddress: String = ""
    
    var body: some View {
        Group {
            ScrollView {
                ForEach(order.orderItems) { item in
                    HStack {
                        Text("\(item.quantity) x \(item.fruit.emoji)\(item.fruit.name.capitalized)")
                        
                        Spacer()
                        
                        Text("\(item.countItemSubtotalInRupiah())")
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 5)
                }
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .padding()
                
                
                
                HStack {
                    Text("Total Price")
                    
                    Spacer()
                    
                    Text("\(order.getTotalPriceInRupiah())")
                }
                .font(.body)
                .fontWeight(.bold)
                .padding(.horizontal, 30)
                .padding(.bottom, 100)
                
                
                VStack(alignment: .center) {
                    Text("Delivery Address:")
                        .padding(.top, 30)
                        .padding(.horizontal)
                        
                    
                    Text("\(userAddress)")
                        .font(.title2)
                        .padding()
                        .padding(.bottom, 30)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("SoftGray"))
                
            }
            .padding(.top, 20)
        }
        .navigationTitle("Order Summary")
    }
}
