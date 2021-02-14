//
//  FeaturedTabView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FeaturedTabView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    @State var index: Int
    
    var body: some View {
        TabView(selection: $index){
            ForEach(modelData.flowers) { flower in
                HStack{
                    VStack(alignment: .leading){
                        Text(flower.name)
                            .font(.system(size: 24, weight: .bold, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        Text(flower.descriptions)
                            .font(.system(size: 18, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                    }
                    .padding()
                    Image(flower.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height*0.3)
                }
//                            .padding()
                .frame(width: UIScreen.main.bounds.width*0.90, height: self.index == flower.id ? UIScreen.main.bounds.height*0.30 : UIScreen.main.bounds.height*0.28)
                
            }
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .padding()
        }
        .animation(.easeInOut(duration: 0.3))
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView(index: 1)
    }
}
