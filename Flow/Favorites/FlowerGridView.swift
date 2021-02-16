//
//  FlowerGridView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FlowerGridView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var isZoomed = false
    @State var rating = 3
    
    @Binding var columns : [GridItem]
    
    @Namespace private var namespace
    
    var flower : Flower
    
    var frame: CGFloat {
        columns.count == 2 ? UIScreen.main.bounds.width * 0.38 : UIScreen.main.bounds.width * 0.4
    }
    
    var flowerIndex: Int {
        modelData.flowers.firstIndex(where: { $0.id == flower.id })!
    }
    
    var body: some View {
        VStack{
            if self.columns.count == 2{
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top))  {
                    Button {
                    } label: {
                        FavoriteFlowerButton(isSet: $modelData.flowers[flowerIndex].isSelected, width: 26, height: 24)
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
                                destination: FlowerDetail(flowerDetail: flower),
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
                        Text(flower.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 24, weight: .regular, design: .serif))
                            .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                        Spacer()
                    }
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
                ZStack{
                    VStack{
                        HStack {
                            NavigationLink(
                                destination: FlowerDetail(flowerDetail: flower),
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
                                .offset(x: frame - frame * 0.5, y: frame - frame * 1.13)
                                .matchedGeometryEffect(id: "favoritesDetail", in: self.namespace)
                            Spacer()
                            Button {
                            } label: {
                                FavoriteFlowerButton(isSet: $modelData.flowers[flowerIndex].isSelected, width: 26, height: 24)
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
                        Text(flower.name)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 24, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    .frame(width: frame + frame * 0.7, height: frame - frame * 0.1)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                        }
                    )
                    .offset(x: frame * 0.3)
                    Image(flower.image)
                        .resizable()
                        .frame(width: frame + frame * 0.1, height: frame + frame * 0.1)
                        .cornerRadius(500)
                        .frame(width: frame + frame * 0.1, height: frame + frame * 0.1)
                        .background(
                            Group {
                                CustomAccountButtonsView4()
                            }
                        )
                        .offset(x: -frame * 0.65)
                }
            }
        }
        .animation(.easeOut)
    }
}
