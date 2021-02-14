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
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 5, y: 5)
            .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -2.5, y: -2.5)
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(colorScheme == .dark ? Color.bottomShadowDark : Color.bottomShadow, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 20)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(colorScheme == .dark ? Color.topShadowDark : Color.topShadow, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 20)            .fill(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)))
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

//struct SettingsView: View {
//    @State private var isToggled = false
//
//    var body: some View {
//        ZStack {
//            LinearGradient(Color.darkStart, Color.darkEnd)
//
//            VStack(spacing: 40) {
//                Button(action: {
//                    print("Button tapped")
//                }) {
//                    Image(systemName: "heart.fill")
//                        .foregroundColor(.white)
//                }
//                .buttonStyle(ColorfulButtonStyle())
//
//                Toggle(isOn: $isToggled) {
//                    Image(systemName: "heart.fill")
//                        .foregroundColor(.white)
//                }
//                .toggleStyle(ColorfulToggleStyle())
//            }
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}

