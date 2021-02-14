//
//  NearlyStores.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct NearlyStores: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0) {
                ForEach(modelData.stores) { store in
                    NavigationLink(
                        destination: StoreDetail(coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city, coordinateDays: store.days),
                        label: {
                            ZStack{
                                Image(store.image)
                                    .resizable()
                                    .cornerRadius(10)
                                Text(store.name)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 16, weight: .black, design: .serif))
                                    .foregroundColor(store.textColor == "white" ? .white : .offSecondaryGray)
                            }
                        })
                }
                .frame(width: 120, height: 150)
                .background(
                    Group {
                        NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                    }
                )
                .padding(.horizontal, 8)
                .padding(.vertical)
            }
        }
        .background(
            Group {
                NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
            }
        )
    }
}

struct NearlyStores_Previews: PreviewProvider {
    static var previews: some View {
        NearlyStores()
            .environmentObject(ModelData())
    }
}
