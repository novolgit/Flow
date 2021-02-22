//
//  MockTabView.swift
//  Flow
//
//  Created by Vlad Novol on 2/22/21.
//

import SwiftUI

struct MockTabView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State var index: Int
    @State var showMore = false
    
    @Namespace private var namespace
    
    var body: some View {
        TabView(selection: self.$index){
            ForEach(modelData.mocks) {mock in
                    VStack {
                        HStack {
                            if !showMore {
                                Text(mock.title)
                                    .font(.system(size: 24, weight: .bold, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            } else {
                                        Image(mock.image)
                                            .resizable()
                                            .frame(maxWidth: UIScreen.main.bounds.width*0.3, maxHeight: UIScreen.main.bounds.height*0.1)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(.horizontal, 10)
                                            .padding(.top, 10)
//                                            .matchedGeometryEffect(id: "mockImage", in: self.namespace)
                            }
                            Spacer()
                                Button(action: {
                                    self.showMore.toggle()
                                },
                                       label: {
                                        ChevronCustomButtonStyle(isSet: $showMore, size: 24)
                                       }
                                )
                                .frame(width: 40, height: 40)
                                .background(
                                    Group {
                                        NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                    }
                                )
                        }
                        .padding(.horizontal)
                        .padding(.top)
                        if !showMore {
                            Image(mock.image)
                                .resizable()
                                .frame(maxHeight: UIScreen.main.bounds.height*0.3)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.horizontal, 10)
                                .padding(.bottom, 10)
//                                .matchedGeometryEffect(id: "mockImage", in: self.namespace)
                        }
                        if showMore {
                            VStack{
                                HStack {
                                    Text("Description")
                                        .font(.system(size: 22, weight: .medium, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                    Spacer()
                                }
                                Text(mock.subTitle)
                                    .font(.system(size: 16, weight: .light, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            }
                            .padding()
                        }
                    }
                    .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .padding()
            }
        }
    }
}

struct MockTabView_Previews: PreviewProvider {
    static var previews: some View {
        MockTabView(index: 1)
    }
}
