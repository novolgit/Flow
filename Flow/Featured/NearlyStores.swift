//
//  NearlyStores.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct NearlyStores: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0) {
                ForEach(modelData.stores) { store in
                VStack{
                    Text(store.name)
                        .font(.system(size: 14, weight: .bold, design: .serif))
                        .foregroundColor(.gray)
                    Spacer()
                    Text(store.hours)
                        .font(.system(size: 12, weight: .bold, design: .serif))
                        .foregroundColor(.gray)
                    }
                .padding()
                }
                .frame(width: 100, height: 110)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                    }
                )
                .padding()
            }
        }
        .background(
            Group {
                NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
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
