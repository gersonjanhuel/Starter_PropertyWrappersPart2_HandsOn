//
//  OrderItem.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import Foundation

class OrderItem: ObservableObject, Identifiable {
    // MARK: properties
    let uuid: UUID = UUID()    
    @Published var fruit: Fruit
    @Published var quantity: Int
    
    // initializer
    init(fruit: Fruit, quantity: Int) {
        self.fruit = fruit
        self.quantity = quantity
    }
    
    // MARK: methods
    
    func countItemSubtotal() -> Int {
        return fruit.price * quantity
    }
    
    func countItemSubtotalInRupiah() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        let formattedSubtotalString = formatter.string(from: NSNumber(value: countItemSubtotal())) ?? "0"
        
        return "Rp \(formattedSubtotalString)"
    }
}

