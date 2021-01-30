//
//  ModelListData.swift
//  Flow
//
//  Created by Vlad Novol on 25.01.2021.
//

import Foundation

struct Model: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
}
