//
//  FlowerListData.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import Foundation

struct Flower: Codable, Identifiable {
    let id: Int
    let category: Category
    let price: Double
    let descriptions, image, name: String
}

enum Category: String, Codable {
    case containerPlants = "Container Plants"
    case herbaceousPerennials = "Herbaceous Perennials"
    case null = "null"
    case shrubs = "Shrubs"
}
