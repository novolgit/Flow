//
//  ContentView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


extension Color {
    
    static let offWhite = Color.init(hex: "#ffffff")
    static let offGray = Color(#colorLiteral(red: 0.9510897994, green: 0.9554912448, blue: 0.9662502408, alpha: 1))
    static let offGrayLinearStart = Color(#colorLiteral(red: 0.9226110578, green: 0.9374341369, blue: 0.9470742345, alpha: 1))
    static let offGrayLinearEnd = Color(#colorLiteral(red: 0.8825169206, green: 0.9076496959, blue: 0.9166089892, alpha: 1))
    static let tappedOffWhiteStart = Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 0.2955374813))
    static let tappedOffWhiteEnd = Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 0.04870170948))
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)

    static let lightStart = Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 0.05445376773))
    static let lightEnd = Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 0.1484740807))
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .topLeading)
    }
}

struct ContentView: View {
    @State private var selection: Tab = .featured
    @EnvironmentObject var modelData: ModelData
   
    enum Tab {
        case featured
        case constructor
        case purchase
        case favorite
    }
    
    var body: some View {
        TabView(selection: $selection) {
            FeaturedView(chart: modelData.charts[0])
//                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                .tabItem {
                    Label("Main", systemImage: "target")
                }
                .tag(Tab.featured)
                ConstructorView()
//                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                .tabItem {
                    Label("Constructor", systemImage: "scale.3d")
                }
                .tag(Tab.constructor)
            PurchaseView()
//                .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.9, blendDuration: 0.1))
                .tabItem {
                    Label("Purchase", systemImage: "purchased")
                }
                .tag(Tab.purchase)
            FavoritesView()
//                .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.9, blendDuration: 0.1))
                .tabItem {
                    HStack {
                        Label("Favorites", systemImage: selection == .favorite ? "star.fill" : "star")
                    }
                    .frame(width: 20, height: 20)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                        }
                )
                }
                .tag(Tab.favorite)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .red
        }
//        .accentColor(Color(#colorLiteral(red: 0.5538704991, green: 0, blue: 0.245544076, alpha: 1)))
        .accentColor(Color(.darkGray))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
