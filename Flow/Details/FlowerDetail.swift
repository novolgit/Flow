//
//  FlowerDetail.swift
//  Flow
//
//  Created by Vlad Novol on 29.01.2021.
//

import SwiftUI

struct FlowerDetail: View {
    @Environment(\.colorScheme) var colorScheme
    
    var flowerDetail: Flower
    
    var body: some View {
        VStack {
            ZStack{
                Image(flowerDetail.image)
                    .resizable()
                    .frame(width: 340, height: 430)
                    .ignoresSafeArea(.all)
                Text(flowerDetail.name)
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                    .font(.system(size: 34, weight: .bold, design: .serif))
                    .offset(y: 130)
                Button(action: {
                    
                }, label: {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 43, height: 40)
                        .foregroundColor(Color.pink.opacity(0.7))
                })
                .offset(x: 160, y: -180)
            }
            VStack{
                ZStack{
                    HStack{
                        Text(String(flowerDetail.price) + "$")
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 20, weight: .regular, design: .serif))
                    }
                    .padding()
                    .background(
                        Group {
                            NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2.5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                        }
                    )
                    .offset(x: 125)
                    .padding()
                    HStack{
                        Text(flowerDetail.group ?? "")
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 20, weight: .regular, design: .serif))
                    }
                    .padding()
                    .background(
                        Group {
                            NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2.5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                        }
                    )
                    .offset(x: -125)
                    .padding()
                }
                .offset(y: -58)
                VStack(alignment: .leading) {
                    Text("Some about \(flowerDetail.name)")
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        .font(.system(size: 24, weight: .semibold, design: .serif))
                        .padding(.bottom, 5)
                    Text(flowerDetail.descriptions)
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        .font(.system(size: 18, weight: .regular, design: .serif))
                    Spacer()
                }
                .offset(y: -50)
            }
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .offset(y: -50)
            .padding()
        }
        .navigationBarTitle(flowerDetail.name, displayMode: .inline)
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct FlowerDetail_Previews: PreviewProvider {
    static var previews: some View {
        FlowerDetail(flowerDetail: ModelData().flowers[0])
    }
}
