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
                    .frame(width: 320, height: 320)
                    .clipShape(Circle())
                    .frame(width: 320, height: 320)
                    .background(
                        Group {
                            CustomAccountButtonsView3()
                        }
                    )
                    .offset(y: 10)
                Text(flowerDetail.name)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                    .font(.system(size: 25, weight: .black, design: .serif))
                    .offset(y: 10)
                    .padding(80)
                Button(action: {
                    
                }, label: {
                    ZStack {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 38, height: 36)
                            .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                        Image(systemName: "heart")
                            .resizable()
                            .font(.system(size: 10, weight: .ultraLight, design: .serif))
                            .frame(width: 38, height: 36)
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.1) : Color.offSecondaryGray.opacity(0.1))
                    }
                        
                })
                .offset(x: 160, y: -130)
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
                }
                .offset(y: -58)
                VStack(alignment: .leading) {
                    Text("Some about \(flowerDetail.name)")
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        .font(.system(size: 24, weight: .semibold, design: .serif))
                        .padding(.bottom, 5)
                        .padding(.trailing, 100)
                    Text(flowerDetail.descriptions)
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        .font(.system(size: 18, weight: .regular, design: .serif))
                    Spacer()
                }
                .offset(y: -100)
            }
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .offset(y: 20)
            .frame(height: 300)
//            .frame(width: UIScreen.main.bounds.width)
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .navigationBarTitle(flowerDetail.name, displayMode: .inline)
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct FlowerDetail_Previews: PreviewProvider {
    static var previews: some View {
        FlowerDetail(flowerDetail: ModelData().flowers[80])
            .preferredColorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
