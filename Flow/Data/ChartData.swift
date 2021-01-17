//
//  ChartData.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import Foundation

struct Chart: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation]

    static var formatter = LengthFormatter()

    struct Observation: Codable, Hashable {
        var distanceFromStart: Double

        var flowers: Range<Double>
        var stores: Range<Double>
        var bouquet: Range<Double>
    }
}
