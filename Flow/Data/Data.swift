//
//  Data.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import Foundation
import SwiftUI
import CoreLocation

final class ModelData: ObservableObject {
    @Published var flowers: [Flower] = load("flowersList.json")
    @Published var stores: [Store] = load("storesList.json")
    @Published var accounts: [Account] = load("accountList.json")
    var charts: [Chart] = load("chartData.json")
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}






