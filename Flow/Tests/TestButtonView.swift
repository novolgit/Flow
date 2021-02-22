//
//  TestButtonView.swift
//  Flow
//
//  Created by Vlad Novol on 2/17/21.
//

import SwiftUI

struct AppLogoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var logoAnimate = false
    
    var body: some View {
        ZStack{
            LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                .ignoresSafeArea(.all)
            ZStack{
                Text("F")
                    .font(.system(size: 260, weight: .bold, design: .serif))
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                    .offset(x: !logoAnimate ? -70 : 0)
                    .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                      axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                Text("L")
                    .font(.system(size: 260, weight: .bold, design: .serif))
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                    .offset(x: !logoAnimate ? 70 : 0)
                    .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                    .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                      axis: (x: 0.0, y: 1.0, z: 0.0))
            }
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
            .frame(width: 380, height: 380)
            .background(
                Group {
                    NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .onTapGesture{
                logoAnimate.toggle()
            }
        }
    }
}

struct AppLogoDegreesView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var logoAnimate = false
    
    var body: some View {
        ZStack{
            LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                .ignoresSafeArea(.all)
            ZStack{
                Circle()
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .frame(width: 350, height: 350)
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 10)
            }
            ZStack{
                Circle()
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .frame(width: 350, height: 350)
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 20)
            }
            ZStack{
                Circle()
                    .background(
                        Group {
                            NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: 0, yWhite: 0)
                        }
                    )
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 10, x: 10, y: 10)
                    .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 10, x: -5, y: -5)
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .frame(width: 350, height: 350)
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 30)
                ZStack{
                    Text("F")
                        .font(.system(size: 260, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                        .offset(x: !logoAnimate ? -70 : 0)
                        .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                          axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                    Text("L")
                        .font(.system(size: 260, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                        //                    .offset(x: 68)
                        .offset(x: !logoAnimate ? 70 : 0)
                        .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                        .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                          axis: (x: 0.0, y: 1.0, z: 0.0))
                }
                .offset(y: 20)
                .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
                .frame(width: 350, height: 350)
                .background(
                    Group {
                        NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 0, yBlack: 0, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                .onTapGesture{
                    logoAnimate.toggle()
                }
            }
        }
    }
}

struct LogoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                .ignoresSafeArea(.all)
            ZStack{
                Text("N")
                    .font(.system(size: 260, weight: .bold, design: .serif))
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                    .offset(x: -30)
                Text("L")
                    .font(.system(size: 260, weight: .bold, design: .serif))
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                    .offset(x: 68)
            }
            .frame(width: 380, height: 380)
            .background(
                Group {
                    NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
        }
    }
}

struct AppLogoView_Previews: PreviewProvider {
    static var previews: some View {
        AppLogoView()
            .preferredColorScheme(.light)
    }
}
