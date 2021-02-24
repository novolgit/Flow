//
//  AfterLoginView.swift
//  Flow
//
//  Created by Vlad Novol on 2/17/21.
//

import SwiftUI

struct AfterLoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var startAnimationText: Bool = false
    @State var logoAnimate: Bool = false
    @State var endAnimate: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
            VStack {
                HStack {
                    Text("Welcome to ")
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Text("FLos")
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
                .scaleEffect(!startAnimationText ? 0 : 1)
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
                .frame(width: 380, height: 380)
                .background(
                    Group {
                        NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                    }
                )
                .ignoresSafeArea(.all, edges: .all)
            }
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                    logoAnimate.toggle()
                withAnimation(Animation.linear(duration: 1)) {
                    endAnimate.toggle()
                }
                
                self.startAnimationText = true
            }
    }
    }
}

struct AfterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AfterLoginView()
    }
}
