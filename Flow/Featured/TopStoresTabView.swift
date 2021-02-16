//
//  TopStoresTabView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct TopStoresTabView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    @State var index: Int
    
    var body: some View {
        TabView(selection: self.$index){
            ForEach(modelData.stores) { store in
                VStack{
                    HStack {
                            Text(store.name)
                                .font(.system(size: 24, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        Spacer()
                        NavigationLink(
                            destination: StoreDetail(store: store, coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city, coordinateDays: store.days),
                            label: {
                                    Image(systemName: "ellipsis")
                            })
                            .frame(width: 40, height: 40)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                }
                            )
                    }
                    HStack{
                    Image(store.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(
                            cornerRadius: 10
                        ))
                        Spacer()
//                                .frame(width: UIScreen.main.bounds.width*0.5, height: 150)
                        VStack{
                            HStack {
                                Text("working days")
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                Spacer()
                                Text(store.days)
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            }
                            Spacer()
                            HStack {
                                Text("working hours")
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                Spacer()
                                Text(store.hours)
                                    .font(.system(size: 14, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            }
                        }
                        .padding()
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.92, height: self.index == store.id ? UIScreen.main.bounds.height*0.25 : UIScreen.main.bounds.height*0.22)
            }
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .padding()
        }
    }
}

struct TopStoresTabView_Previews: PreviewProvider {
    static var previews: some View {
        TopStoresTabView(index: 1)
    }
}
