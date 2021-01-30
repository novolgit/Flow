//
//  RowContentView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct RowContentView : View {
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
                            .font(.system(size: 16, weight: .medium, design: .serif))
                            .foregroundColor(Color.gray)
                        Text(flower.name)
                            .font(.system(size: 20, weight: .medium, design: .serif))
                        
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Price")
                            .font(.system(size: 16, weight: .medium, design: .serif))
                            .foregroundColor(Color.gray)
                        
                        
                        Text(String(flower.price) + "$")
                            .font(.system(size: 20, weight: .medium, design: .serif))
                        
                    }
                    //                    VStack{}.frame(width: !isSet ? 39 : 10)
                    VStack {
                        Button(action: {
                            isSet.toggle()
                        }) {
                            Image(systemName: isSet ? "cart.badge.minus.fill" : "cart.badge.plus")
                                .foregroundColor(Color.gray)
                            
                        }
                    }
                    .padding()
                }
                .padding()
                .frame(width : geo.size.width, height: 100)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                ZStack {
                    Image(systemName: "trash")
                        .font(.system(size: 20))
                        .scaleEffect(scale)
                }
                .frame(width: 100, height: geo.size.height)
                .background(
                    Group {
                        NeuButtonsView(radius: 10, color: Color.purple.opacity(0.3), whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                    }
                )
                .onTapGesture {
//                    withAnimation(.spring()){deleteItem()}
                }
                .offset(x:20)
                .padding()
                ZStack {
                    Image(systemName: "app.gift.fill")
                        .font(.system(size: 20))
                        .overlay(
                            Image(systemName: "star")
                                .font(.system(size: 10))
                                .offset(y: self.offsetY)
                        )
                }
                .frame(width: 100, height: geo.size.height)
                .background(
                    Group {
                        NeuButtonsView(radius: 10, color: Color.pink.opacity(0.3), whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                    }
                )
                .onTapGesture {
                    // TO DO add to favorites
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
        flowers.removeAll { (flower) -> Bool in
            return self.flower.id == flower.id
        }
    }
}

