//
//  ConfirmPage3View.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI

struct ConfirmPage3View: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var payment: String = "ApplePay"
    @State private var presentingSecurityAlert = false
    
    @Binding var currentPage: Int
    
    var totalPrice: Double
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack{
                Button(action: {
                    currentPage -= 1
                }, label: {
                    ZStack {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 38, height: 36)
                            .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                        Image(systemName: "chevron.left")
                            .resizable()
                            .font(.system(size: 10, weight: .light, design: .serif))
                            .frame(width: 11, height: 19)
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.5) : Color.offSecondaryGray.opacity(0.5))
                            .offset(x: -1)
                    }
                })
                Spacer()
                Button(action: {
                    currentPage += 1
                }, label: {
                    ZStack {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 38, height: 36)
                            .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .font(.system(size: 10, weight: .light, design: .serif))
                            .frame(width: 11, height: 19)
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.5) : Color.offSecondaryGray.opacity(0.5))
                            .offset(x: 1)
                    }
                })
            }
            .padding()
            VStack {
                HStack{
                    Text("Choose payment method")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Spacer()
                    Menu(payment) {
                        Button("Apple Pay", action: {
                            payment = "ApplePay"
                        })
                        Button("Card", action: {
                            payment = "Card"
                        })
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .padding()
                    .frame(width: 130, height: 60)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                        }
                    )
                }
                .padding(.horizontal,16)
                .padding(.vertical,3)
            }
            if payment == "ApplePay" {
                PayWithAppleView()
            }
            if payment == "Card" {
                CreditCardView()
            }
            Spacer()
        }
        .navigationBarTitle("Payment", displayMode: .inline)
        .navigationBarItems(trailing: Text(String(totalPrice))
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray))
    }
}
