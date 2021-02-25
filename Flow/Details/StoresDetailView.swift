//
//  StoresDetailView.swift
//  Flow
//
//  Created by Vlad Novol on 2/15/21.
//

import SwiftUI

struct StoresDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredFavoriteStores: [Store] {
        modelData.stores.filter { store in
            (!showFavoritesOnly || store.isSelected)
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{}.frame(height: 20)
            HStack{
                Spacer()
                Toggle(isOn: $showFavoritesOnly) {
                }
                .toggleStyle(PressToggleStyle(imageSize: 20, offsetValue: 16, toggleWidth: 80, toggleHeight: 40, borderWidth: 70, borderHeight: 30, image: "star", imageFill: "star.fill", lightColor: Color.yelloww, darkColor: Color.yellowwDark, lineWidth: 1))
                .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
            }
            .padding()
            LazyVStack {
                ForEach(filteredFavoriteStores) { store in
                    NavigationLink(
                        destination: StoreDetail(store: store, coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city, coordinateDays: store.days),
                        label: {
                            HStack {
                                Image(store.image)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * 0.225, height: UIScreen.main.bounds.height * 0.15)
                                    .clipShape(Circle())
                                Spacer()
                                Text(store.name)
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                    .font(.system(size: 18, weight: .regular, design: .serif))
                                ZStack{
                                    if store.isSelected {
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 30, height: 28)
                                            .foregroundColor(colorScheme == .light ? .yellowwDark : .yelloww)
                                        //                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                                        //                                .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                                        Image(systemName: "star")
                                            .resizable()
                                            .font(.system(size: 10, weight: .ultraLight, design: .serif))
                                            .frame(width: 30, height: 28)
                                            .foregroundColor(colorScheme == .dark ? Color.yellowwDark.opacity(0.1) : Color.yelloww.opacity(0.1))
                                    } else {
                                        Image(systemName: "star")
                                            .resizable()
                                            .frame(width: 30, height: 28)
                                            .foregroundColor(colorScheme == .light ? .yellowwDark : .yelloww)
                                        //                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                                        //                                .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                                        Image(systemName: "star")
                                            .resizable()
                                            .font(.system(size: 10, weight: .ultraLight, design: .serif))
                                            .frame(width: 30, height: 28)
                                            .foregroundColor(colorScheme == .dark ? Color.yellowwDark.opacity(0.1) : Color.yelloww.opacity(0.1))
                                    }
                                }
                            }
                            .padding()
                            .frame(height: 100)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                            )
                            .padding(.horizontal)
                            .padding(.vertical, 2)
                        })
                }
            }
        }
        .navigationBarTitle("Stores")
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct StoresDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoresDetailView()
            .environmentObject(ModelData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
