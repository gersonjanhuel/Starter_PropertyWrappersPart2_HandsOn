//
//  PickFruitsView.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import SwiftUI

struct PickFruitsView: View {
    var order = Order()
    
    // static data
    var availableFruits: [Fruit] = [
        Fruit(emoji: "🍉", name: "watermelon", price: 7_500),
        Fruit(emoji: "🍏", name: "apple", price: 15_000),
        Fruit(emoji: "🍌", name: "banana", price: 5_000)
    ]
    
    var body: some View {
        NavigationStack {
            Group {
                ScrollView {
                    ForEach(availableFruits) { fruit in
                        FruitItemList(fruit: fruit)
                    }
                }
                .padding(.top, 20)
                .navigationTitle("Pick Your Fruits")
                

                NavigationLink {
                    QuantityReviewView()
                } label: {
                    Text("Review Quantity")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        
                }
                .background(order.orderItems.count == 0 ? Color.gray : Color.blue)
                .padding(.vertical)
                .disabled(order.orderItems.count == 0)

            }
        }
        
        
    }
}

// Subview 
struct FruitItemList: View {
    var order: Order 
    
    // passed from parent view
    var fruit: Fruit
    
    var body: some View {
        Button {
            
            if order.isFruitExist(fruit: fruit) {
                order.removeOrderItem(with: fruit)
            } else {
                let newOrderItem = OrderItem(fruit: fruit, quantity: 1)
                
                order.addNewOrderItem(newItem: newOrderItem)
            }
            
        } label: {
            
            HStack {
                Text("\(fruit.emoji)")
                    .font(.system(size: 50))
                    
                Text("\(fruit.name.capitalized)")
                    .foregroundColor(order.isFruitExist(fruit: fruit) ? .white : .black)
            }
            .padding(.horizontal, 20)
            
            
            Spacer()
            
        }
        
        .frame(width: 350, height: 80)
        .background(order.isFruitExist(fruit: fruit) ? Color("Green") : Color("SoftGray"))
        .cornerRadius(15)
        .padding(.bottom, 10)
    }
    
}
