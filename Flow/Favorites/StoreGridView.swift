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
    
    var store : Store
    var frame: CGFloat {
        columns.count == 2  ? 160 : 170
    }

    var body: some View {
        VStack{
            if self.columns.count == 2{
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top))  {
                        Button {
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 25, height: 23)
                                .foregroundColor(Color.pink.opacity(0.4))
                        }
                        .frame(width: 35, height: 35)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                            }
                        )
                        .offset(x: frame - 130, y: frame - 190)
                        .matchedGeometryEffect(id: "favoritesHeat", in: self.namespace)
                    VStack{
                        HStack{
                        NavigationLink(
                            destination: StoreDetail(coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city),
                            label: {
                                HStack {
                                    Image(systemName: "ellipsis")
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
                            .offset(x: frame - 160, y: frame - 190)
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
                                    Image(systemName: "eye")
                                    Text("Assortment")
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
                            .offset(x: frame - 170, y: frame - 5)
                }
                .padding()
                .frame(width: frame + 15, height: frame + 30)
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
                            .frame(width: frame + 10, height: frame + 10)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                                }
                            )
                    VStack{
                        HStack {
                            NavigationLink(
                                destination: StoreDetail(coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city),
                                label: {
                                    HStack {
                                        Image(systemName: "ellipsis")
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
                                .offset(x: frame - 160, y: frame - 190)
                                .matchedGeometryEffect(id: "favoritesDetail", in: self.namespace)
                            Spacer()
                            Button {
                            } label: {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 25, height: 23)
                                    .foregroundColor(Color.pink.opacity(0.4))
                            }
                            .frame(width: 35, height: 35)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - 160, y: frame - 190)
                            .matchedGeometryEffect(id: "favoritesHeat", in: self.namespace)
                        }
                        Text(store.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                        Spacer()
                        RatingView(rating: $rating)
                            .matchedGeometryEffect(id: "favoritesRating", in: self.namespace)
                        Spacer()
                        NavigationLink(
                            destination: AssortmentDetailsView(),
                            label: {
                                HStack {
                                    Image(systemName: "eye")
                                    Text("Assortment")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 16, weight: .light, design: .serif))
                                }
                            })
                            .matchedGeometryEffect(id: "favoritesAssort", in: self.namespace)
                            .padding(5)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - 185, y: frame - 160)
                    }
                }
                .frame(width: frame + 200, height: frame - 10)
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
