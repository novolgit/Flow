//
//  CustomProgressView.swift
//  Flow
//
//  Created by Vlad Novol on 2/24/21.
//

import SwiftUI

struct CustionProgressView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var startAnimationText: Bool = false
    @State var logoAnimate: Bool = false
    @State var endAnimate: Bool = false
    
    var frame: CGFloat
    var fontSize: CGFloat
    var offset: CGFloat
    
    var body: some View {
            ZStack{
                Text("F")
                    .font(.system(size: fontSize, weight: .bold, design: .serif))
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                    .offset(x: !logoAnimate ? -offset : 0)
                    .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                      axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                //                        .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                Text("L")
                    .font(.system(size: fontSize, weight: .bold, design: .serif))
                    .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                    .offset(x: !logoAnimate ? offset : 0)
                    //                        .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                    .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                      axis: (x: 0.0, y: 1.0, z: 0.0))
            }
            .frame(width: frame, height: frame)
        .animation(Animation.spring(response: 1, dampingFraction: 1, blendDuration: 1).repeatForever())
        .onAppear{
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    logoAnimate.toggle()
                }
            }
        }
    }
}
