//
//  FlowApp.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import Firebase

@main
struct FlowApp: App {
    @StateObject private var modelData = ModelData()
    
    init() {
      FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
