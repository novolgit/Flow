//
//  CustomButtonsView.swift
//  Flow
//
//  Created by Vlad Novol on 12.01.2021.
//

import SwiftUI

struct NeuButtonsView: View{
    let radius: CGFloat
    let color: Color
    let whiteColorOpacity: Color
    let blackColorOpacity: Color
    let shadowRadius: CGFloat
    let xBlack: CGFloat
    let yBlack: CGFloat
    let xWhite: CGFloat
    let yWhite: CGFloat
    
    var body: some View{
        RoundedRectangle(cornerRadius: radius)
            .fill(color)
            .shadow(color: blackColorOpacity, radius: shadowRadius, x:xBlack, y:yBlack)
            .shadow(color: whiteColorOpacity, radius: shadowRadius, x:xWhite, y:yWhite)
    }
}

struct NeuButtonsView2: View{
    @Environment(\.colorScheme) var colorScheme
    
    let radius: CGFloat
    let whiteColorOpacity: Color
    let blackColorOpacity: Color
    let shadowRadius: CGFloat
    let xBlack: CGFloat
    let yBlack: CGFloat
    let xWhite: CGFloat
    let yWhite: CGFloat
    
    var body: some View{
        RoundedRectangle(cornerRadius: radius)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: blackColorOpacity, radius: shadowRadius, x:xBlack, y:yBlack)
            .shadow(color: whiteColorOpacity, radius: shadowRadius, x:xWhite, y:yWhite)
    }
}

struct NeuButtonsView3: View{
    @Environment(\.colorScheme) var colorScheme
    
    let radius: CGFloat
    let whiteColorOpacity: Color
    let blackColorOpacity: Color
    let shadowRadius: CGFloat
    let xBlack: CGFloat
    let yBlack: CGFloat
    let xWhite: CGFloat
    let yWhite: CGFloat
    
    var body: some View{
        RoundedRectangle(cornerRadius: radius)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark.opacity(0.2) : Color.offGrayLinearStart.opacity(0.2), colorScheme == .dark ? Color.offGrayLinearEndDark.opacity(0.2) : Color.offGrayLinearEnd.opacity(0.2)))
            .shadow(color: blackColorOpacity, radius: shadowRadius, x:xBlack, y:yBlack)
            .shadow(color: whiteColorOpacity, radius: shadowRadius, x:xWhite, y:yWhite)
    }
}

struct ContainerView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(color)
            .shadow(color: Color.init(hex: "#e6e6e6"), radius: 5, x:10, y:10)
            .shadow(color: Color.init(hex: "#ffffff"), radius: 5, x:-5, y:-5)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.init(hex: "#e6e6e6"), lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 3, y: 3)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(Color.init(hex: "#87d1c2"), .offWhite)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.offWhite, lineWidth: 8)
                    .blur(radius: 3)
                    .offset(x: -3, y: -3)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(.offWhite, Color.init(hex: "#87d1c2"))))
            )
    }
}

struct Container2View: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "#c9d6ff"), Color.init(hex: "#e9e4f0")]), startPoint: .leading, endPoint: .trailing))
            .shadow(color: Color.init(hex: "#e6e6e6"), radius: 5, x:10, y:10)
            .shadow(color: Color.init(hex: "#ffffff"), radius: 5, x:-5, y:-5)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.init(hex: "#e6e6e6"), lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 3, y: 3)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(Color.init(hex: "#87d1c2"), .offWhite)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.offWhite, lineWidth: 8)
                    .blur(radius: 3)
                    .offset(x: -3, y: -3)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(.offWhite, Color.init(hex: "#87d1c2"))))
            )
    }
}

struct CustomAccountButton:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(Color.offGray, Color.offWhite))
            .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 2))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 5, x: 5, y: 5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 5, x: -5, y: -5)
    }
}

struct CustomAccountButton2:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 15.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 5, x: 5, y: 5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 5, x: -5, y: -5)
    }
}

struct CustomTappedAccountButton:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(Color.offGray, Color.offWhite))
            .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 2))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 1, x: -2, y: -2)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 1, x: 4, y: 4)
    }
}

struct CustomTappedAccountButton2:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 150.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 5, x: -5, y: -5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 5, x: 5, y: 5)
    }
}

struct CustomTappedAccountButton3:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 20.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 3, x: -5, y: -5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: 2.5, y: 2.5)
    }
}

struct CustomTappedAccountButton4:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 10.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2, x: 2, y: 2)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 2, x: -1, y: -1)
    }
}

struct CustomTappedAccountButton5:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 15.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 3, x: -5, y: -5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: 2.5, y: 2.5)
    }
}

struct CustomTappedAccountButton6:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 10.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 3, x: -3, y: -3)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: 1.5, y: 1.5)
    }
}

struct CustomTappedAccountButton7:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 3, x: -5, y: -5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: 2.5, y: 2.5)
    }
}

struct CustomTappedAccountButton8:View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, radius: 3, x: -3, y: -3)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: 1.5, y: 1.5)
    }
}


struct CustomTappedButtonsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.offWhite)
            //            .fill(LinearGradient(gradient: Gradient(colors: [Color.tappedOffWhiteStart, Color.tappedOffWhiteEnd, Color.tappedOffWhiteStart]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 7, x:-5, y:-5)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 7, x:7, y:7)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 8)
                    .blur(radius: 4)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(Color.black, Color.clear)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(Color.clear, Color.black)))
            )
    }
}

struct CustomAccountButtonsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x:-3, y:-3)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x:6, y:6)
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 2.5)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 100.0).fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd, colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 2.5)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(Circle()            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomAccountButtonsView2: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 4, x:2, y:2)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 4, x:-4, y:-4)
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 100.0)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 4)
                    .blur(radius: 2)
                    .offset(x: -2, y: -2)
                    .mask(Circle()            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomAccountButtonsView3: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 300.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 8, x:-4, y:-4)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 8, x:8, y:8)
            .overlay(
                RoundedRectangle(cornerRadius: 300.0)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 300.0)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 300.0)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 4)
                    .blur(radius: 2)
                    .offset(x: -2, y: -2)
                    .mask(Circle()            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomAccountButtonsView4: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 300.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 4, x:-2, y:-2)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 4, x:4, y:4)
            .overlay(
                RoundedRectangle(cornerRadius: 300.0)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 1)
                    .blur(radius: 14)
                    .offset(x: 4, y: 4)
                    .mask(RoundedRectangle(cornerRadius: 300.0)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 300.0)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 14)
                    .offset(x: -4, y: -4)
                    .mask(Circle()            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomPurchaseButtonsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 5, x:-5, y:-5)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 5, x:10, y:10)
            .overlay(
                RoundedRectangle(cornerRadius:20.0)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 2)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 100.0)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:20.0)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 20.0)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 5, x:-2.5, y:-2.5)
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 5, x:5, y:5)
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 2)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 20)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 20)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView3: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 5, y: 5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -2.5, y: -2.5)
            .overlay(
                RoundedRectangle(cornerRadius:15)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 15)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:15)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 15)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView4: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2, x: -2, y: -2)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 2, x: 1, y: 1)
            .overlay(
                RoundedRectangle(cornerRadius:10)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 5)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 10)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:10)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 1)
                    .blur(radius: 5)
                    .offset(x: 1, y: 1)
                    .mask(RoundedRectangle(cornerRadius: 10)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView5: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 5, y: 5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -2.5, y: -2.5)
            .overlay(
                RoundedRectangle(cornerRadius:15)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 15)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:15)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 15)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView6: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
            .overlay(
                RoundedRectangle(cornerRadius:10)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 10)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:10)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 10)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView7: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 5, y: 5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -2.5, y: -2.5)
            .overlay(
                RoundedRectangle(cornerRadius:100)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 100)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:100)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 100)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView8: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 100)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
            .overlay(
                RoundedRectangle(cornerRadius:100)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 100)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:100)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 100)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
    }
}

struct ColorfulBackground<S: Shape>: View {
    @Environment(\.colorScheme) var colorScheme
    
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.offGray, Color.offWhite))
                    .overlay(shape.stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 4))
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 10, x: 5, y: 5)
                    .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.offGray, Color.offWhite))
                    .overlay(shape.stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 4))
                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 10, x: -10, y: -10)
                    .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(RoundedRectangle(cornerRadius: 20))
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: RoundedRectangle(cornerRadius: 20))
            )
            .animation(nil)
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .contentShape(RoundedRectangle(cornerRadius: 20.0))
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: RoundedRectangle(cornerRadius: 20.0))
        )
    }
}

struct FavoriteFlowerButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isSet: Bool
    
    @State private var showingAlert = false
    
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Button(action: {
            if isSet {
                showingAlert = true
            } else {
                isSet = true
            }
        }) {
            ZStack {
                if isSet {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .light ? .reddDark : .redd)
                    //                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                    //                    .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                    Image(systemName: "heart")
                        .resizable()
                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .dark ? Color.reddDark.opacity(0.1) : Color.redd.opacity(0.1))
                }
                else {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .light ? Color.reddDark.opacity(0.5) : Color.redd.opacity(0.5))
                    //                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                    //                        .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                    Image(systemName: "heart")
                        .resizable()
                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .dark ? Color.reddDark.opacity(0.1) : Color.redd.opacity(0.1))
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Remove from favorites?"), primaryButton: .destructive(Text("Yes")) {
                isSet = false
            },
            secondaryButton: .cancel())
        }
    }
}

struct FavoriteStoreButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isSet: Bool
    
    @State private var showingAlert = false
    
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Button(action: {
            if isSet {
                showingAlert = true
            } else {
                isSet = true
            }
        }) {
            ZStack {
                if isSet {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .light ? .yellowwDark : .yelloww)
                    //                    .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                    //                    .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                    Image(systemName: "star")
                        .resizable()
                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .dark ? Color.yellowwDark.opacity(0.1) : Color.offSecondaryGray.opacity(0.1))
                }
                else {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .light ? Color.yellowwDark.opacity(0.5) : Color.yelloww.opacity(0.5))
                    //                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                    //                        .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                    Image(systemName: "star")
                        .resizable()
                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                        .frame(width: width, height: height)
                        .foregroundColor(colorScheme == .dark ? Color.yellowwDark.opacity(0.1) : Color.yelloww.opacity(0.1))
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Remove from favorites?"), primaryButton: .destructive(Text("Yes")) {
                isSet = false
            },
            secondaryButton: .cancel())
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    @Environment(\.colorScheme) var colorScheme
    
    @GestureState var tap = false
    
    var imageSize: CGFloat
    var offsetValue: CGFloat
    var toggleWidth: CGFloat
    var toggleHeight: CGFloat
    var borderWidth: CGFloat
    var borderHeight: CGFloat
    
    var image: String
    var imageFill: String
    
    var lightColor: Color
    var darkColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            configuration.label
            ZStack{
                Image(systemName: "heart")
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                    .opacity(configuration.isOn ? 0 : 1)
                    .scaleEffect(configuration.isOn ? 0 : 1)
                    .offset(x: tap ? 50 : -50)
                Image(systemName: "heart.fill")
                    .font(.system(size: imageSize, weight: .light))
                    .clipShape(Capsule(style: .continuous).offset(y: tap ? 0 : 60))
                    .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                    .animation(.easeInOut)
                    .opacity(configuration.isOn ? 0 : 1)
                    .scaleEffect(configuration.isOn ? 0 : 1)
                    .offset(x: tap ? 50 : -50)
                Image(systemName: "heart.fill")
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(Color.reddDark)
                    .opacity(configuration.isOn ? 1 : 0)
                    .scaleEffect(configuration.isOn ? 1 : 0)
                    .offset(x: tap ? -50 : 50)
                    .scaleEffect(configuration.isOn ? 1.1 : 1)
            }
            .frame(width: 220, height: 100)
            //            .background(
            //                ZStack{
            //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
            //
            ////                    Capsule(style: .continuous)
            ////                            .stroke(Color.clear, lineWidth: 1)
            ////                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: -4, y: -4)
            ////
            ////                    Capsule(style: .continuous)
            ////                        .stroke(Color.clear, lineWidth: 1)
            ////                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: 5, y: 5)
            //                }
            //            )
            .clipShape(Capsule(style: .continuous))
            .overlay(
                Capsule(style: .continuous)
                    .trim(from: tap ? 0.001 : 1, to: 1)
                    .stroke(LinearGradient(colorScheme == .dark ? Color.redd : Color.redd, colorScheme == .light ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .frame(width: 200, height: 80)
                    .rotationEffect(Angle(degrees: 0))
                    .rotation3DEffect(
                        Angle(degrees: 360),
                        axis: (x: 1.0, y: 0.0, z: 0.0))
                    .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 5, x: 3, y: 3)
                    .animation(.easeInOut)
            )
            .background(
                Group {
                    NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .gesture(
                LongPressGesture().updating($tap) {currentState, gestureState, transaction in
                    gestureState = currentState
                }
                //                    .onChanged { value in
                //                        configuration.isOn.toggle()
                //                    }
                .onEnded { value in
                    configuration.isOn.toggle()
                }
            )
        }
    }
}

struct CustomToggleStyle2: ToggleStyle {
    @Environment(\.colorScheme) var colorScheme
    
    @GestureState var tap = false
    
    var imageSize: CGFloat
    var offsetValue: CGFloat
    var toggleWidth: CGFloat
    var toggleHeight: CGFloat
    var borderWidth: CGFloat
    var borderHeight: CGFloat
    
    var image: String
    var imageFill: String
    
    var lightColor: Color
    var darkColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            configuration.label
            ZStack{
                Image(systemName: "heart")
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                    .opacity(configuration.isOn ? 0 : 1)
                    .scaleEffect(configuration.isOn ? 0 : 1)
                    .offset(x: tap ? 50 : -50)
                Image(systemName: "heart.fill")
                    .font(.system(size: imageSize, weight: .light))
                    .clipShape(RoundedRectangle(cornerRadius: 10).offset(y: tap ? 0 : 60))
                    .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                    .animation(.easeInOut)
                    .opacity(configuration.isOn ? 0 : 1)
                    .scaleEffect(configuration.isOn ? 0 : 1)
                    .offset(x: tap ? 50 : -50)
                Image(systemName: "heart.fill")
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(Color.reddDark)
                    .opacity(configuration.isOn ? 1 : 0)
                    .scaleEffect(configuration.isOn ? 1 : 0)
                    .offset(x: tap ? -50 : 50)
                    .scaleEffect(configuration.isOn ? 1.1 : 1)
            }
            .frame(width: 220, height: 100)
            //            .background(
            //                ZStack{
            //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
            //
            //                    RoundedRectangle(cornerRadius: 20)
            //                            .stroke(Color.clear, lineWidth: 1)
            //                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: -4, y: -4)
            //
            //                    RoundedRectangle(cornerRadius: 20)
            //                        .stroke(Color.clear, lineWidth: 1)
            //                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: 5, y: 5)
            //                }
            //            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .trim(from: tap ? 0.001 : 1, to: 1)
                    .stroke(LinearGradient(colorScheme == .dark ? Color.redd : Color.redd, colorScheme == .light ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                    .frame(width: 206, height: 86)
                    .rotationEffect(Angle(degrees: 0))
                    .rotation3DEffect(
                        Angle(degrees: 360),
                        axis: (x: 1.0, y: 0.0, z: 0.0))
                    .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 5, x: 3, y: 3)
                    .animation(.easeInOut)
            )
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .gesture(
                LongPressGesture().updating($tap) {currentState, gestureState, transaction in
                    gestureState = currentState
                }
                //                    .onChanged { value in
                //                        configuration.isOn.toggle()
                //                    }
                .onEnded { value in
                    configuration.isOn.toggle()
                }
            )
        }
    }
}

struct PressToggleStyle: ToggleStyle {
    @Environment(\.colorScheme) var colorScheme
    
    var imageSize: CGFloat
    var offsetValue: CGFloat
    var toggleWidth: CGFloat
    var toggleHeight: CGFloat
    var borderWidth: CGFloat
    var borderHeight: CGFloat
    
    var image: String
    var imageFill: String
    
    var lightColor: Color
    var darkColor: Color
    
    var lineWidth: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            configuration.label
            ZStack{
                Image(systemName: image)
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(colorScheme == .dark ? darkColor : lightColor)
                    .opacity(configuration.isOn ? 0 : 1)
                    .scaleEffect(configuration.isOn ? 0 : 1)
                    .offset(x: configuration.isOn ? offsetValue : -offsetValue)
                Image(systemName: imageFill)
                    .font(.system(size: imageSize, weight: .light))
                    .clipShape(Capsule(style: .continuous).offset(y: configuration.isOn ? 0 : 60))
                    .foregroundColor(colorScheme == .dark ? darkColor : lightColor)
                    .animation(.easeInOut)
                    .opacity(configuration.isOn ? 0 : 1)
                    .scaleEffect(configuration.isOn ? 0 : 1)
                    .offset(x: configuration.isOn ? offsetValue : -offsetValue)
                Image(systemName: imageFill)
                    .font(.system(size: imageSize, weight: .light))
                    .foregroundColor(darkColor)
                    .opacity(configuration.isOn ? 1 : 0)
                    .scaleEffect(configuration.isOn ? 1 : 0)
                    .offset(x: configuration.isOn ? offsetValue : -offsetValue)
                    .scaleEffect(configuration.isOn ? 1.1 : 1)
            }
            .frame(width: toggleWidth, height: toggleHeight)
            //            .background(
            //                ZStack{
            //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
            //
            ////                    Capsule(style: .continuous)
            ////                            .stroke(Color.clear, lineWidth: 1)
            ////                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: -4, y: -4)
            ////
            ////                    Capsule(style: .continuous)
            ////                        .stroke(Color.clear, lineWidth: 1)
            ////                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: 5, y: 5)
            //                }
            //            )
            .clipShape(Capsule(style: .continuous))
            .overlay(
                Capsule(style: .continuous)
                    .trim(from: configuration.isOn ? 0.001 : 1, to: 1)
                    .stroke(LinearGradient(colorScheme == .dark ? darkColor : lightColor, colorScheme == .light ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width: borderWidth, height: borderHeight)
                    .rotationEffect(Angle(degrees: 0))
                    .rotation3DEffect(
                        Angle(degrees: 360),
                        axis: (x: 1.0, y: 0.0, z: 0.0))
                    .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 5, x: 3, y: 3)
                    .animation(.easeInOut)
            )
            .background(
                Group {
                    NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2.5, xBlack: 2.5, yBlack: 2.5, xWhite: -1.25, yWhite: -1.25)
                }
            )
            .onTapGesture {
                configuration.isOn.toggle()
            }
        }
    }
}

struct CustomButtonStyle: View {
    @Environment(\.colorScheme) var colorScheme
    
    @GestureState var tap = false
    @State var press = false
    
    var size: CGFloat
    
    var body: some View{
        ZStack{
            Image(systemName: "heart")
                .font(.system(size: size, weight: .light))
                .offset(x: press ? -90 : 0, y: press ? 20 : 0)
                .rotation3DEffect(Angle.degrees(press ? 100 : 0), axis: (x: 10, y: 10, z: 20))
                .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
            Image(systemName: "heart.fill")
                .font(.system(size: size, weight: .light))
                .offset(x: press ? 0 : 90, y: press ? 0 : 20)
                .rotation3DEffect(Angle.degrees(press ? 0 : 100), axis: (x: -10, y: -10, z: 20))
                .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        //            .background(
        //                ZStack{
        //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
        //
        //                        Circle()
        //                            .stroke(Color.clear, lineWidth: 1)
        //                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 10, x: -2, y: -2)
        //                            .blur(radius: 10)
        //
        //                    Circle()
        //                        .stroke(Color.clear, lineWidth: 1)
        //                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 10, x: 4, y: 4)
        //                        .blur(radius: 10)
        //                }
        //            )
        .clipShape(Circle())
        .background(
            Group {
                if press {
                    Group {
                        CustomTappedAccountButton7()
                    }
                } else {
                    Group {
                        CustomConfirmButtonsView7()
                    }
                }
            }
        )
        //            .scaleEffect(press ? 1.1 : 1)
        .gesture(
            LongPressGesture().updating($tap) {currentState, gestureState, transaction in
                gestureState = currentState
            }
            //                .onChanged { value in
            //                    if self.press == true {
            //                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //                            self.press = false
            //                        }
            //                    } else {
            //                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //                            self.press = false
            //                        }
            //                    }
            //                }
            .onChanged { value in
                self.press.toggle()
            }
        )
    }
}

struct ChevronCustomButtonStyle: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isSet: Bool
    
    var size: CGFloat
    
    var body: some View{
        ZStack{
            Image(systemName: "chevron.right.circle")
                .font(.system(size: size, weight: .light))
                //                    .offset(x: isSet ? -90 : 0, y: isSet ? 20 : 0)
                .opacity(!isSet ? 1 : 0)
                .rotationEffect(Angle.degrees(!isSet ? 90 * 5 : 0))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
            Image(systemName: "chevron.right.circle.fill")
                .font(.system(size: size, weight: .light))
                //                    .offset(x: isSet ? 0 : 90, y: isSet ? 0 : 20)
                .opacity(isSet ? 1 : 0)
                .rotationEffect(Angle.degrees(!isSet ? 0 : 90 * 5))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
        }
        .scaleEffect(isSet ? 1.1 : 1)
        .frame(width: 40, height: 40)
        //            .background(
        //                ZStack{
        //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
        //
        //                        Circle()
        //                            .stroke(Color.clear, lineWidth: 1)
        //                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 10, x: -2, y: -2)
        //                            .blur(radius: 10)
        //
        //                    Circle()
        //                        .stroke(Color.clear, lineWidth: 1)
        //                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 10, x: 4, y: 4)
        //                        .blur(radius: 10)
        //                }
        //            )
        .clipShape(Circle())
        .background(
            Group {
                if isSet {
                    Group {
                        CustomTappedAccountButton8()
                    }
                } else {
                    Group {
                        CustomConfirmButtonsView8()
                    }
                }
            }
        )
        .scaleEffect(isSet ? 1.1 : 1)
        //            .scaleEffect(press ? 1.1 : 1)
        .onTapGesture{
            self.isSet.toggle()
        }
        
    }
}

struct FlowerCustomButtonStyle: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isSet: Bool
    
    //    @State private var showingAlert = false
    //    @State var press = false
    
    var size: CGFloat
    
    var body: some View{
        ZStack{
            Image(systemName: "heart")
                .font(.system(size: size, weight: .light))
                .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                .opacity(isSet ? 0 : 1)
                .scaleEffect(isSet ? 0 : 1)
            Image(systemName: "heart.fill")
                .font(.system(size: size, weight: .light))
                .clipShape(Rectangle().offset(y: isSet ? 0 : 60))
                .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                .animation(.easeInOut)
                .opacity(isSet ? 0 : 1)
                .scaleEffect(isSet ? 0 : 1)
            Image(systemName: "heart.fill")
                .font(.system(size: size, weight: .light))
                .foregroundColor(colorScheme == .dark ? .reddDark : .redd)
                .opacity(isSet ? 1 : 0)
                .scaleEffect(isSet ? 1 : 0)
        }
        .frame(width: 55, height: 55)
        //            .background(
        //                ZStack{
        //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
        //
        //                        Circle()
        //                            .stroke(Color.clear, lineWidth: 1)
        //                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: -4, y: -4)
        //
        //                    Circle()
        //                        .stroke(Color.clear, lineWidth: 1)
        //                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: 5, y: 5)
        //                }
        //            )
        .clipShape(Circle())
        .overlay(
            Circle()
                .trim(from: isSet ? 0.001 : 1, to: isSet ? 1 : 0.001)
                .stroke(LinearGradient(colorScheme == .dark ? Color.redd : Color.redd, colorScheme == .light ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: isSet ? 0 : 180),
                    axis: (x: 0.0, y: 0.0, z: 0.0))
                .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 5, x: 3, y: 3)
                .animation(.spring())
        )
        .background(
            Group {
                NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
            }
        )
        .scaleEffect(isSet ? 1.1 : 1)
        .onTapGesture {
            self.isSet.toggle()
            //                    if !isSet {
            //                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //                            showingAlert = true
            //                        }
            //                    } else {
            //                        isSet = true
            //                    }
        }
        //        .alert(isPresented: $showingAlert) {
        //            Alert(title: Text("Remove from favorites?"), primaryButton: .destructive(Text("Yes")) {
        //                isSet = false
        //            },
        //            secondaryButton: .cancel(){isSet = true})
        //        }
    }
}

struct StoreCustomButtonStyle: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isSet: Bool
    
    @State private var showingAlert = false
    
    @GestureState var tap = false
    //    @State var press = false
    
    var size: CGFloat
    
    var body: some View{
        ZStack{
            Image(systemName: "star")
                .font(.system(size: size, weight: .light))
                .foregroundColor(colorScheme == .dark ? .yellowwDark : .yelloww)
                .opacity(isSet ? 0 : 1)
                .scaleEffect(isSet ? 0 : 1)
            Image(systemName: "star.fill")
                .font(.system(size: size, weight: .light))
                .clipShape(Rectangle().offset(y: isSet ? 0 : 60))
                .foregroundColor(colorScheme == .dark ? .yellowwDark : .yelloww)
                .animation(.easeInOut)
                .opacity(isSet ? 0 : 1)
                .scaleEffect(isSet ? 0 : 1)
            Image(systemName: "star.fill")
                .font(.system(size: size, weight: .light))
                .foregroundColor(colorScheme == .dark ? .yellowwDark : .yelloww)
                .opacity(isSet ? 1 : 0)
                .scaleEffect(isSet ? 1 : 0)
        }
        .frame(width: 30, height: 30)
        //            .background(
        //                ZStack{
        //                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
        //
        //                        Circle()
        //                            .stroke(Color.clear, lineWidth: 1)
        //                            .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: -4, y: -4)
        //
        //                    Circle()
        //                        .stroke(Color.clear, lineWidth: 1)
        //                        .shadow(color: colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray, radius: 8, x: 5, y: 5)
        //                }
        //            )
        .clipShape(Circle())
        .overlay(
            Circle()
                .trim(from: isSet ? 0.001 : 1, to: isSet ? 1 : 0.001)
                .stroke(LinearGradient(colorScheme == .dark ? Color.yellowwDark : Color.yelloww, colorScheme == .light ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd), style: StrokeStyle(lineWidth: 1, lineCap: .round))
                .frame(width: 27, height: 27)
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: isSet ? 0 : 180),
                    axis: (x: 0.0, y: 0.0, z: 0.0))
                .shadow(color: colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray, radius: 5, x: 3, y: 3)
                .animation(.spring())
                .offset(y: 1)
        )
        //            .background(
        //                Group {
        //                    NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
        //                }
        //            )
        .scaleEffect(isSet ? 1.1 : 1)
        .onTapGesture {
            self.isSet.toggle()
            //                    if !isSet {
            //                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //                            showingAlert = true
            //                        }
            //                    } else {
            //                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //                        isSet = true
            //                        }
            //                    }
        }
        //            .alert(isPresented: $showingAlert) {
        //                Alert(title: Text("Remove from favorites?"), primaryButton: .destructive(Text("Yes")) {
        //                    isSet = false
        //                },
        //                secondaryButton: .cancel(){isSet = true})
        //        }
    }
}
