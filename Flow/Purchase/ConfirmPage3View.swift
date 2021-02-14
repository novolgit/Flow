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
                Image(systemName: "chevron.left.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .padding(7)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                })
                Spacer()
                Button(action: {
                    currentPage += 1
                }, label: {
                Image(systemName: "chevron.right.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .padding(7)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
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
                PaymentButtonView()
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
