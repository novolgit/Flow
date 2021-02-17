//
//  ContentView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

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
                    .tabItem {
                        Label("Main", systemImage: "target")
                    }
                    .tag(Tab.featured)
                ConstructorView()
                    .tabItem {
                        Label("Constructor", systemImage: "scale.3d")
                    }
                    .tag(Tab.constructor)
                PurchaseView()
                    .tabItem {
                        Label("Purchase", systemImage: "purchased")
                    }
                    .tag(Tab.purchase)
                FavoritesView()
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
                Image("launch")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 85, height: animate ? nil : 85)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: launchAnimate)
            .opacity(endAnimate ? 0 : 1)
        }
    }
    func launchAnimate() {
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
