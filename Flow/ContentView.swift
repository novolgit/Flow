//
//  ContentView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    @EnvironmentObject var modelData: ModelData
    
    
    
    enum Tab {
        case featured
//        case profile
        case constructor
        case bin
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FeaturedView()
                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                .tabItem {
                    Label("Main", systemImage: "target")
                }
                .tag(Tab.featured)
//            ProfileView()
//                .tabItem {
//                    Label("Profile", systemImage: "person")
//                }
//                .tag(Tab.profile)
                ConstructorView()
                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                .tabItem {
                    Label("Constructor", systemImage: "scale.3d")
                }
                .tag(Tab.constructor)
            BinView()
                .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.9, blendDuration: 0.1))
                .tabItem {
                    Label("Bin", systemImage: "trash")
                }
                .tag(Tab.bin)
        }
        
        .onAppear() {
            UITabBar.appearance().backgroundColor = .red
        }
        .accentColor(.pink)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
