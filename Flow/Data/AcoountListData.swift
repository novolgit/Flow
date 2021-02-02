//
//  AcoountListData.swift
//  Flow
//
//  Created by Vlad Novol on 13.01.2021.
//

import Foundation

struct Account: Codable, Identifiable {
    var name: String
    var phone: String
    var id: Int
    var image: String
    var street: String
    var house: Int
    var kv: Int
    var floor: Int
    var entrance: Int
    var bonuses: Int
    var email: String
    var profile: String
    var city: String
}

struct AccountFirebase: Codable {
    var uid: String
    var name: String
    var phone: String
    var bio: String
    var profileImage: String
    var bonuses: Int
}
