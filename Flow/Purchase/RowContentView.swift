//
//  RowContentView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct RowContentView : View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var flower: Flower
    @Binding var flowers: [Flower]
    @Binding var isSet: Bool
    
    @State var offset = CGSize.zero
    @State var offsetY : CGFloat = 0
    @State var scale : CGFloat = 0.5
    
    var body : some View {
        GeometryReader { geo in
            HStack (spacing : 0){
                HStack{
                    VStack(alignment: .leading) {
                        Text("Name")
                            .font(.system(size: 16, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.7) : Color.offSecondaryGray.opacity(0.7))
                        Text(flower.name)
                            .font(.system(size: 18, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.system(size: 16, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.7) : Color.offSecondaryGray.opacity(0.7))
                        Text(String(flower.price) + "$")
                            .font(.system(size: 18, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        
                    }
                    VStack {
                        Button(action: {
                            isSet.toggle()
                        }) {
                            ZStack{
                                if flower.isPurchase {
                                    Image(systemName: "cart.fill.badge.minus")
                                        .resizable()
                                        .frame(width: 30, height: 26)
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                                        .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                                    Image(systemName: "cart.badge.minus")
                                        .resizable()
                                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                                        .frame(width: 30, height: 26)
                                        .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.1) : Color.offSecondaryGray.opacity(0.1))
                                } else {
                                    Image(systemName: "cart.badge.plus")
                                        .resizable()
                                        .frame(width: 30, height: 26)
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                                        .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                                    Image(systemName: "cart.badge.plus")
                                        .resizable()
                                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                                        .frame(width: 30, height: 26)
                                        .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.1) : Color.offSecondaryGray.opacity(0.1))
                                }
                            }
                        }
                    }
                    .padding()
                }
                .padding()
                .frame(width : geo.size.width, height: 100)
                .background(
                    Group {
                        NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                ZStack {
                    Image(systemName: "trash")
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .scaleEffect(scale)
                }
                .frame(width: 100, height: geo.size.height)
                .background(
                    Group {
                        NeuButtonsView(radius: 10, color: Color.purple.opacity(0.3), whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .onTapGesture {
                    withAnimation(.spring()){deleteItem()}
                }
                .offset(x:20)
                .padding()
                ZStack {
                    Image(systemName: "app.gift.fill")
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .overlay(
                            Image(systemName: "star")
                                .font(.system(size: 10, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                .offset(y: self.offsetY)
                        )
                }
                .frame(width: 100, height: geo.size.height)
                .background(
                    Group {
                        NeuButtonsView(radius: 10, color: Color.pink.opacity(0.3), whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .onTapGesture {
                    withAnimation(.spring()){giftItem()}
                }
                .offset(x:20)
            }
            .offset(self.offset)
            .gesture(DragGesture()
                        .onChanged { gestrue in
                            self.offset.width = gestrue.translation.width
                        }
                        .onEnded { _ in
                            if self.offset.width < -50 {
                                self.scale = 1
                                self.offset.width = -260
                                self.offsetY = -20
                            } else {
                                self.scale = 0.5
                                self.offset = .zero
                                self.offsetY = 0
                            }
                        }
            )
            .animation(.spring())
        }
    }
    
    func deleteItem(){
        //        flowers.removeAll { (flower) -> Bool in
        //            return self.flower.id == flower.id
        //        }
    }
    
    func giftItem(){
        //        flowers.append(flower.id) { (flower) -> Bool in
        //            return self.flower.id == flower.id
        //        }
    }
}

