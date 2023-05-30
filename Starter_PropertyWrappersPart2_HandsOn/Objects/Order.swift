//
//  ContentView.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import Foundation

class Order: ObservableObject {
    // MARK: properties
    
    @Published var orderItems: [OrderItem] = []
    @Published var totalPrice: Int = 0
    
    
    // MARK: methods
    
    func countOrderTotalPrice() {
        var total = 0
        for item in orderItems {
            total = total + item.countItemSubtotal()
        }
        totalPrice = total
    }
    
    func addNewOrderItem(newItem: OrderItem) {
        orderItems.append(newItem)
        countOrderTotalPrice()
    }
    
    func removeOrderItem(with fruit: Fruit) {
        orderItems.removeAll(where: { $0.fruit == fruit })
        countOrderTotalPrice()
    }
    
    func isFruitExist(fruit: Fruit) -> Bool {
        if let _ = orderItems.first(where: { $0.fruit == fruit }) {
            return true
        }
        return false
    }
    
    func getTotalPriceInRupiah() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let formattedSubtotalString = formatter.string(from: NSNumber(value: totalPrice)) ?? "0"
        
        return "Rp \(formattedSubtotalString)"
    }
}



