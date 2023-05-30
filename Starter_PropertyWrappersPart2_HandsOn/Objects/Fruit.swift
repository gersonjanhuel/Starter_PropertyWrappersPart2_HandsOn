//
//  Fruit.swift
//  ProjectX
//
//  Created by Gerson Janhuel on 30/05/23.
//

import Foundation

struct Fruit: Hashable, Identifiable {
    // MARK: properties
    let id: UUID = UUID()
    let emoji: String
    let name: String
    let price: Int
}
