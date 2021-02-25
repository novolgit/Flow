//
//  FlowApp.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

@main
struct FlowApp: App {
    @StateObject private var modelData = ModelData()
    @StateObject private var favoriteFlowers = FavoriteFlowers()
    
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(favoriteFlowers)
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
