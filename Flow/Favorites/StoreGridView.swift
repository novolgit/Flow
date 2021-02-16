//
//  FlowerGridView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct StoreGridView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var isZoomed = false
    @State var rating = 3
    
    @Binding var columns : [GridItem]
    
    @Namespace private var namespace
    
    @State private var showFavoritesOnly = false
    @State var flowerID = Flower.ID()
    
    var store : Store
    
    var frame: CGFloat {
        columns.count == 2 ? UIScreen.main.bounds.width * 0.38 : UIScreen.main.bounds.width * 0.4
    }
    
    var storeIndex: Int {
        modelData.stores.firstIndex(where: { $0.id == store.id })!
    }

    var body: some View {
        VStack{
            if self.columns.count == 2{
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top))  {
                        Button {
                        } label: {
                            FavoriteStoreButton(isSet: $modelData.stores[storeIndex].isSelected, width: 26, height: 24)
                        }
                        .frame(width: frame * 0.225, height: frame * 0.225)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                            }
                        )
                        .offset(x: frame - frame * 0.83, y: frame - frame * 1.225)
                        .matchedGeometryEffect(id: "favoritesHeat", in: self.namespace)
                    VStack{
                        HStack{
                        NavigationLink(
                            destination: StoreDetail(store: store, coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city, coordinateDays: store.days),
                            label: {
                                HStack {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                    Text("more")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                }
                            })
                            .padding(5)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - frame * 1.067, y: frame - frame * 1.21)
                            .matchedGeometryEffect(id: "favoritesDetail", in: self.namespace)
                            Spacer()
                        }
                    Text(store.name)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        .font(.system(size: 24, weight: .regular, design: .serif))
                        .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                    Spacer()
                    RatingView(rating: $rating)
                        .matchedGeometryEffect(id: "favoritesRating", in: self.namespace)
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        .font(.system(size: 16, weight: .light, design: .serif))
                    Spacer()
                }
                        NavigationLink(
                            destination: AssortmentDetailsView(),
                            label: {
                                HStack {
                                    Text("Assortment")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                }
                            })
                            .matchedGeometryEffect(id: "favoritesAssort", in: self.namespace)
                            .padding(5)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - frame * 1.05, y: frame)
                }
                .padding()
                    .frame(width: frame + frame * 0.1, height: frame + frame * 0.2)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .padding(.bottom, 20)
            }
            else{
                HStack{
                        Image(store.image)
                            .resizable()
                            .frame(width: frame, height: frame)
                            .cornerRadius(10)
                            .frame(width: frame + frame * 0.05, height: frame + frame * 0.05)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2.5, xBlack: 2.5, yBlack: 2.5, xWhite: -1.25, yWhite: -1.25)
                                }
                            )
                    VStack{
                        HStack {
                            NavigationLink(
                                destination: StoreDetail(store: store, coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city, coordinateDays: store.days),
                                label: {
                                    HStack {
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                            .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                        Text("more")
                                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                            .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                    }
                                })
                                .padding(5)
                                .background(
                                    Group {
                                        NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                    }
                                )
                                .offset(x: frame - frame * 0.98, y: frame - frame * 1.12)
                                .matchedGeometryEffect(id: "favoritesDetail", in: self.namespace)
                            Spacer()
                            Button {
                            } label: {
                                FavoriteStoreButton(isSet: $modelData.stores[storeIndex].isSelected, width: 26, height: 24)
                            }
                            .frame(width: frame * 0.225, height: frame * 0.225)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - frame * 0.95, y: frame - frame * 1.12)
                            .matchedGeometryEffect(id: "favoritesHeat", in: self.namespace)
                        }
                        Text(store.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                        Spacer()
                        RatingView(rating: $rating)
                            .matchedGeometryEffect(id: "favoritesRating", in: self.namespace)
                        Spacer()
                        NavigationLink(
                            destination: AssortmentDetailsView(),
                            label: {
                                HStack {
                                    Text("Assortment")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .light, design: .serif))
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                }
                            })
                            .matchedGeometryEffect(id: "favoritesAssort", in: self.namespace)
                            .padding(5)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - frame * 1.2, y: frame - frame * 0.93)
                    }
                }
                .frame(width: frame + frame * 1.33, height: frame - frame * 0.09)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                    }
                )
                .padding()
            }
        }
        .animation(.easeOut)
    }
}
