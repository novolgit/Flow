//
//  StoreListData.swift
//  Flow
//
//  Created by Vlad Novol on 11.01.2021.
//

import Foundation
import SwiftUI
import CoreLocation

// MARK: - FlowerElement
struct Store: Codable, Identifiable {
    var city, hours, description, name, image, phone: String
    var id: Int
    var rating: Int
    var textColor: String
    var days: String
    var isSelected: Bool
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
