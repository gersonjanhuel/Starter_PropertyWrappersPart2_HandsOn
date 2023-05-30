//
//  QuantityReviewView.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import SwiftUI

struct QuantityReviewView: View {
    var order: Order
    
    var body: some View {
        print("redraw QuantityReviewView")
        return Group {
            ScrollView {
                ForEach(order.orderItems) { item in
                    TransactionView(orderItem: item)
                }
                
                HStack {
                    Text("Total")
                    
                    Spacer()
                    
                    Text("\(order.getTotalPriceInRupiah())")
                }
                .font(.title)
                .padding(.horizontal, 30)
                
                
            }
            .padding(.top, 20)
            
            
            
            
            NavigationLink {
                DeliveryReviewView()
            } label: {
                Text("Review Delivery Address")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    
            }
            .background(Color.blue)
            .padding(.vertical)
            
        }
        .navigationTitle("Review Quantity")
        
        
    }
}

// Subview 
struct TransactionView: View {
    var order: Order
    var orderItem: OrderItem
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Stepper("\(orderItem.fruit.emoji) \(orderItem.fruit.name.capitalized) x\(orderItem.quantity)", value: $orderItem.quantity, in: 1...50)
                    .font(.title2)
                    .padding(.top)
                    .padding(.horizontal)
                    .onChange(of: orderItem.quantity) { newValue in
                        order.countOrderTotalPrice()
                    }
                
                Text("\(orderItem.countItemSubtotalInRupiah())")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.top, -10)
            }
            .background(Color("SoftGray"))
            .padding(.bottom, 30)
            .padding(.horizontal, 30)
            .cornerRadius(30)

        }
    }
}
