//
//  FlowerDetail.swift
//  Flow
//
//  Created by Vlad Novol on 29.01.2021.
//

import SwiftUI

struct FlowerDetail: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    var flowerDetail: Flower
    
    var flowerIndex: Int {
        modelData.flowers.firstIndex(where: { $0.id == flowerDetail.id })!
    }
    
    var body: some View {
        GeometryReader { geometry in
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
                    .offset(y: geometry.size.height * 0.1)
                Text(flowerDetail.name)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                    .font(.system(size: 25, weight: .black, design: .serif))
                    .offset(y: geometry.size.height * 0.1)
                    .padding(80)
                FlowerCustomButtonStyle(isSet: $modelData.flowers[flowerIndex].isSelected, size: 35)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                    .offset(x: geometry.size.width * 0.4, y: -geometry.size.height * 0.1)
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
                    .offset(x: geometry.size.width * 0.35)
                    .padding()
                }
                .offset(x: -geometry.size.width * 0.05, y: -geometry.size.height * 0.055)
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
                .offset(y: -geometry.size.width * 0.25)
            }
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .offset(y: geometry.size.height * 0.1)
            .frame(height: 300)
//            .frame(width: UIScreen.main.bounds.width)
            .padding()
        }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .navigationBarTitle(flowerDetail.name, displayMode: .inline)
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct FlowerDetail_Previews: PreviewProvider {
    static var previews: some View {
        FlowerDetail(flowerDetail: ModelData().flowers[80])
            .environmentObject(ModelData())
            .preferredColorScheme(.dark)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
