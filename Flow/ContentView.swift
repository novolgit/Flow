//
//  ContentView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var constructorData = ConstructorData()
    
    @EnvironmentObject var modelData: ModelData
    
    @State var logoAnimate: Bool = false
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
                    .environmentObject(constructorData)
                    .tabItem {
                        Label("Constructor", systemImage: "scale.3d")
                    }
                    .tag(Tab.constructor)
                PurchaseView()
                    .environmentObject(constructorData)
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
            ZStack{
                LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                    .ignoresSafeArea(.all)
                ZStack{
                    Text("F")
                        .font(.system(size: 260, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                        .offset(x: !logoAnimate ? -70 : 0)
                        .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                          axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                    Text("L")
                        .font(.system(size: 260, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                        .offset(x: !logoAnimate ? 70 : 0)
                        .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                        .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                          axis: (x: 0.0, y: 1.0, z: 0.0))
                }
                .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
                .frame(width: 380, height: 380)
                .background(
                    Group {
                        NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
            }
                .ignoresSafeArea(.all, edges: .all)
                .onAppear(perform: launchAnimate)
                .opacity(endAnimate ? 0 : 1)
        }
    }
    func launchAnimate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                logoAnimate.toggle()
            withAnimation(Animation.linear(duration: 2)) {
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
