//
//  Data.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import Foundation
import SwiftUI
import CoreLocation
import Combine

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class ModelData: ObservableObject {
    @Published var flowers: [Flower] = load("flowersList.json")
    @Published var stores: [Store] = load("storesList.json")
//    @Published var accounts: [Account] = load("accountList.json")
    @Published var models: [Model] = load("modelList.json")
    
    var charts: [Chart] = load("chartData.json")
    
//    private var db = Firestore.firestore()
//
//    func createProfile(profile: AccountFirebase, completion: @escaping (_ profile: AccountFirebase?, _ error: Error?) -> Void) {
//      do {
//        let _ = try db.collection("profiles").document(profile.uid).setData(from: profile)
//        completion(profile, nil)
//      }
//      catch let error {
//        print("Error writing city to Firestore: \(error)")
//        completion(nil, error)
//      }
//    }
//
//    func fetchProfile(userId: String, completion: @escaping (_ profile: AccountFirebase?, _ error: Error?) -> Void) {
//      db.collection("profiles").document(userId).getDocument { (snapshot, error) in
//        let profile = try? snapshot?.data(as: AccountFirebase.self)
//        completion(profile, error)
//      }
//    }
//
////    @Published var accountsFirebase = [AccountFirebase]()
////
////    private var db = Firestore.firestore()
////
////    func fetchData() {
////      db.collection("Users").addSnapshotListener { (querySnapshot, error) in
////        guard let documents = querySnapshot?.documents else {
////          print("No documents")
////          return
////        }
////
////        self.accountsFirebase = documents.map { queryDocumentSnapshot -> AccountFirebase in
////          let data = queryDocumentSnapshot.data()
////          let name = data["userName"] as? String ?? ""
////          let phone = data["phone"] as? Int ?? 0
////          let bio = data["bio"] as? String ?? ""
////          let profileImage = data["imageUrls"] as? String ?? ""
////          let bonuses = data["bonuses"] as? Int ?? 0
////
////          return AccountFirebase(id: .init(), name: name, phone: phone, bio: bio, profileImage: profileImage, bonuses: bonuses)
////        }
////      }
////    }
//}
//
//class SessionStore: ObservableObject {
//  @Published var session: User?
//  @Published var profile: AccountFirebase?
//
//  private var profileRepository = ModelData()
//
//    func signUp(email: String, password: String, name: String, phone: String, bio: String, profileImage: String, bonuses: Int, completion: @escaping (_ profile: AccountFirebase?, _ error: Error?) -> Void) {
//    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//      if let error = error {
//        print("Error signing up: \(error)")
//        completion(nil, error)
//        return
//      }
//
//      guard let user = result?.user else { return }
//      print("User \(user.uid) signed up.")
//
//        let userProfile = AccountFirebase(uid: user.uid, name: name, phone: phone, bio: bio, profileImage: profileImage, bonuses: bonuses)
//      self.profileRepository.createProfile(profile: userProfile) { (profile, error) in
//        if let error = error {
//          print("Error while fetching the user profile: \(error)")
//          completion(nil, error)
//          return
//        }
//        self.profile = profile
//        completion(profile, nil)
//      }
//    }
//  }
//
//  func signIn(email: String, password: String, completion: @escaping (_ profile: AccountFirebase?, _ error: Error?) -> Void) {
//    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//      if let error = error {
//        print("Error signing in: \(error)")
//        completion(nil, error)
//        return
//      }
//
//      guard let user = result?.user else { return }
//      print("User \(user.uid) signed in.")
//
//      self.profileRepository.fetchProfile(userId: user.uid) { (profile, error) in
//        if let error = error {
//          print("Error while fetching the user profile: \(error)")
//          completion(nil, error)
//          return
//        }
//
//        self.profile = profile
//        completion(profile, nil)
//      }
//    }
//  }
//
//  func signOut() {
//    do {
//      try Auth.auth().signOut()
//      self.session = nil
//      self.profile = nil
//    }
//    catch let signOutError as NSError {
//      print("Error signing out: \(signOutError)")
//    }
//  }
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






