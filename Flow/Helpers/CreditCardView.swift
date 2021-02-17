//
//  CreditCardView.swift
//  Flow
//
//  Created by Vlad Novol on 23.01.2021.
//

import SwiftUI
import Combine

struct CreditCardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var cardNumber: String = ""
    @State private var cardHolder: String = ""
    @State private var cardValidDate: String = ""
    @State private var cardCVV: String = ""
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    @State private var numberLimit = 16
    @State private var validLimit = 4
    @State private var cvvLimit = 3
    
    var body: some View {
        VStack{
            Group {
                if !flipped {CardFront(cardNumber: cardNumber, cardHolder: cardHolder, cardValidDate: cardValidDate)}
                else {CardBack(cardCVV: cardCVV)}
            }
            .rotation3DEffect(
                .degrees(degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .padding()
            HStack{
                Image(systemName: "creditcard")
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                TextField("card number", text: $cardNumber)
                    .onReceive(Just(cardNumber)) { _ in limitNumber(numberLimit) }
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .keyboardType(.decimalPad)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    if cardNumber.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
            .padding(.vertical,3)
            HStack{
                Image(systemName: "person.fill.questionmark")
                TextField("cardholder name", text: $cardHolder)
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .disableAutocorrection(true)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    if cardHolder.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
            .padding(.vertical,3)
            HStack{
                HStack{
                    TextField("Valid Untill", text: $cardValidDate)
                        .onReceive(Just($cardValidDate)) { _ in limitValid(validLimit) }
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .keyboardType(.decimalPad)
                }
                .padding()
                .frame(height: 70)
                .background(
                    Group {
                        if cardValidDate.isEmpty {CustomConfirmButtonsView5()}
                        else {CustomTappedAccountButton5()}
                    }
                )
                .padding(.trailing,10)
                HStack{
                    TextField("CVV", text: $cardCVV){ (editingChanged) in
                        withAnimation(.spring()) {
                            degrees += 180
                            flipped.toggle()
                        }
                    }
                    .onReceive(Just($cardCVV)) { _ in limitCVV(cvvLimit) }
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .keyboardType(.decimalPad)
                }
                .padding()
                .frame(height: 70)
                .background(
                    Group {
                        if cardCVV.isEmpty {CustomConfirmButtonsView5()}
                        else {CustomTappedAccountButton5()}
                    }
                )
                .padding(.leading,10)
            }
            .padding(.horizontal,22)
            .padding(.vertical,3)
            Button(action: {
            }, label: {
                Text("Pay")
                    .font(.system(size: 28, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
            })
            .frame(width: 350, height: 100)
            .background(
                Group {
                    if cardNumber.isEmpty || cardHolder.isEmpty || cardValidDate.isEmpty || cardCVV.isEmpty{
                        Group {
                            CustomConfirmButtonsView3()
                        }
                    } else{
                        Group {
                            CustomTappedAccountButton3()
                        }
                    }
                }.padding().animation(nil)
            )
        }
    }
    func limitNumber(_ upper: Int) {
        if cardNumber.count > upper {
            cardNumber = String(cardNumber.prefix(upper))
        }
    }
    
    func limitValid(_ upper: Int) {
        if cardValidDate.count > upper {
            cardValidDate = String(cardValidDate.prefix(upper))
        }
    }
    
    func limitCVV(_ upper: Int) {
        if cardCVV.count > upper {
            cardCVV = String(cardCVV.prefix(upper))
        }
    }
}

struct CreditCardView_Previews: PreviewProvider {
    static var previews: some View {
        CreditCardView()
    }
}

struct CardFront: View {
    @Environment(\.colorScheme) var colorScheme
    
    var cardNumber: String
    var cardHolder: String
    var cardValidDate: String
    
    var body: some View{
        VStack{
            Spacer()
            Text(cardNumber.separating(every: 4, separator: " "))
                .font(.system(size: 20, weight: .light, design: .serif))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                .padding()
            HStack{
                VStack(alignment: .leading){
                    Text("Cardholder")
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Text(cardHolder.uppercased())
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
                Spacer()
                VStack(alignment: .leading){
                    Text("Valid THRU")
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Text(cardValidDate.separating(every: 2, separator: "/"))
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
            }
        }
        .padding()
        .frame(width: 350, height: 200)
        .background(
            Group {
                NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
            }
        )
    }
}

struct CardBack: View {
    @Environment(\.colorScheme) var colorScheme
    
    var cardCVV: String
    
    var body: some View{
        VStack{
            Spacer()
            HStack {
                VStack(alignment: .leading){
                    Text("CVV")
                        .font(.system(size: 16, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Text(cardCVV)
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                Spacer()
            }
        }
        .padding()
        .frame(width: 350, height: 200)
        .background(
            Group {
                NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
            }
        )
    }
}
