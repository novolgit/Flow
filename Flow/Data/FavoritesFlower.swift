//
//  FavoritesFlower.swift
//  Flow
//
//  Created by Vlad Novol on 2/24/21.
//

import SwiftUI

class FavoriteFlowers: ObservableObject {
    // the actual resorts the user has favorited
    private var favoriteFlowers: Set<String>
    
    private let defaults = UserDefaults.standard

    private let saveKey = "FavoriteFlowers"

    init() {
        // load our saved data

        // still here? Use an empty array
        self.favoriteFlowers = []
    }

    // returns true if our set contains this resort
    func contains(_ flower: Flower) -> Bool {
        favoriteFlowers.contains(flower.name)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ flower: Flower) {
        objectWillChange.send()
        favoriteFlowers.insert(flower.name)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ flower: Flower) {
        objectWillChange.send()
        favoriteFlowers.remove(flower.name)
        save()
    }

    func save() {
        // write out our data
        defaults.set(favoriteFlowers, forKey: "FavoriteFlowers")
    }
}
