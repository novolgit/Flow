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
    
    //lightMode
    static let offWhite = Color.init(hex: "#ffffff")
    static let offGray = Color(#colorLiteral(red: 0.9215686275, green: 0.937254902, blue: 0.9490196078, alpha: 1))
    static let topShadow = Color.init(hex: "#ffffff")
    static let bottomShadow = Color.init(hex: "#5e6061")
    static let offSecondaryGray = Color(#colorLiteral(red: 0.1215686275, green: 0.1215686275, blue: 0.1215686275, alpha: 1))
    
    static let offGrayLinearStart = Color(#colorLiteral(red: 0.9226110578, green: 0.9374341369, blue: 0.9470742345, alpha: 1))
    static let offGrayLinearEnd = Color(#colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1))
    
    //darkMode
    static let offWhiteDark = Color.init(hex: "#ffffff")
    static let offGrayDark = Color(#colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1))
    static let topShadowDark = Color.init(hex: "#2a2a2a")
    static let bottomShadowDark = Color.init(hex: "#0a0a0a")
    static let offSecondaryGrayDark = Color(#colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1))
    
    static let offGrayLinearStartDark = Color(#colorLiteral(red: 0.07843137255, green: 0.09411764706, blue: 0.1058823529, alpha: 1))
    static let offGrayLinearEndDark = Color(#colorLiteral(red: 0.09803921569, green: 0.09803921569, blue: 0.09803921569, alpha: 1))
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .bottomTrailing, endPoint: .topLeading)
    }
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State var animate: Bool = false
    @State var endAnimate: Bool = false
    @State private var selection: Tab = .featured
   
    enum Tab {
        case featured
        case constructor
        case purchase
        case favorite
    }
    
    var body: some View {
        ZStack{
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
                                NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                            }
                    )
                    }
                    .tag(Tab.favorite)
            }
            .accentColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
            ZStack {
                Image("120x120_clear")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: launchAninate)
            .opacity(endAnimate ? 0 : 1)
        }
    }
    func launchAninate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.15)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.25)) {
                endAnimate.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}
