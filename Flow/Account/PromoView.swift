//
//  PromoView.swift
//  Flow
//
//  Created by Vlad Novol on 10.01.2021.
//

import SwiftUI

struct PromoView: View {
    @State private var promoText: String = ""
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Promo")
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                    TextField("Enter your promo", text: $promoText)
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                        .keyboardType(.default)
                    Divider()
                }
                Spacer()
            }
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                }
            )
            Spacer()
        }
        .padding()
        .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
        .navigationBarTitle("Promo", displayMode: .inline)
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView()
    }
}
