//
//  FeaturedTabView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FeaturedTabView: View {
    @EnvironmentObject var modelData: ModelData
    @State var index: Int
    
    var body: some View {
        HStack {
            Text("Featured")
                .font(.system(size: 30, weight: .bold, design: .serif))
                .foregroundColor(.gray)
            Spacer()
            Image(systemName: "tablecells")
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        TabView(selection: $index){
            ForEach(modelData.flowers[0].roses[0].shrubs) { flower in
                HStack{
                    VStack(alignment: .leading){
                        Text(flower.name)
                            .font(.system(size: 24, weight: .bold, design: .serif)).foregroundColor(.gray)
                        Text(flower.descriptions)
                            .font(.system(size: 19, weight: .medium, design: .serif))
                            .foregroundColor(.gray)
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
                    NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .padding()
        }
    }
}

struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView(index: 1)
    }
}
