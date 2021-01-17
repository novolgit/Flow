//
//  FlowerListData.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import Foundation

struct Flower: Codable{
    var roses: [Rose]
}

struct Rose: Codable{
    var shrubs: [Shrub]
    var singleheadedRose: [SingleheadedRose]
}

struct Shrub: Codable, Identifiable {
    var price: Double
    var descriptions, image, name: String
    var id: Int
    var isSelected: Bool
}

struct SingleheadedRose: Codable{
    var rosesFrost: [Shrub]
}
