//
//  FlowerGridView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FlowerGridView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var isZoomed = false
    @State var rating = 3
    
    @Binding var columns : [GridItem]
    
    @Namespace private var namespace
    
    var flower : Flower
    var frame: CGFloat {
        columns.count == 2  ? 160 : 170
    }
    
    var body: some View {
        VStack{
            if self.columns.count == 2{
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top))  {
                    Button {
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(Color.pink.opacity(0.4))
                    }
                    .frame(width: 35, height: 35)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 10, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                        }
                    )
                    .offset(x: frame - 130, y: frame - 190)
                    .matchedGeometryEffect(id: "favoritesHeat", in: self.namespace)
                    VStack{
                        HStack{
                            NavigationLink(
                                destination: FlowerDetail(),
                                label: {
                                    HStack {
                                        Image(systemName: "ellipsis")
                                        Text("more")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular, design: .serif))
                                    }
                                })
                                .padding(5)
                                .background(
                                    Group {
                                        NeuButtonsView2(radius: 10, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                    }
                                )
                                .offset(x: frame - 160, y: frame - 190)
                                .matchedGeometryEffect(id: "favoritesDetail", in: self.namespace)
                            Spacer()
                        }
                        Text(flower.name)
                            .lineLimit(2)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.offSecondaryGray)
                            .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                        Spacer()
                    }
                }
                .padding()
                .frame(width: frame + 15, height: frame + 30)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .padding(.bottom, 20)
            }
            else{
                ZStack{
                    VStack{
                        HStack {
                            NavigationLink(
                                destination: FlowerDetail(),
                                label: {
                                    HStack {
                                        Image(systemName: "ellipsis")
                                        Text("more")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular, design: .serif))
                                    }
                                })
                                .padding(5)
                                .background(
                                    Group {
                                        NeuButtonsView2(radius: 10, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                    }
                                )
                                .offset(x: frame - 90, y: frame - 190)
                                .matchedGeometryEffect(id: "favoritesDetail", in: self.namespace)
                            Spacer()
                            Button {
                            } label: {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 25, height: 23)
                                    .foregroundColor(Color.pink.opacity(0.4))
                            }
                            .frame(width: 35, height: 35)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 10, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                                }
                            )
                            .offset(x: frame - 160, y: frame - 190)
                            .matchedGeometryEffect(id: "favoritesHeat", in: self.namespace)
                        }
                        Text(flower.name)
                            .lineLimit(2)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.offSecondaryGray)
                            .matchedGeometryEffect(id: "favoritesTitle", in: self.namespace)
                        Spacer()
                    }
                    .frame(width: frame + 100, height: frame - 10)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                        }
                    )
                    .offset(x: 55)
                    Image(flower.image)
                        .resizable()
                        .frame(width: frame + 10, height: frame + 10)
                        .cornerRadius(500)
                        .frame(width: frame + 10, height: frame + 10)
                        .background(
                            Group {
                                CustomAccountButtonsView2()
                            }
                        )
                        .offset(x: -105)
                }
            }
        }
        .animation(.easeOut)
    }
}
