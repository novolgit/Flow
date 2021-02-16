//
//  FlowerListData.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import Foundation

struct Flower: Codable, Identifiable {
    var price: Double
    var descriptions, image, name: String
    var id: Int
    var isSelected: Bool
    var isPurchase: Bool
    var flower: String
    var group, subGroup: String?
}
