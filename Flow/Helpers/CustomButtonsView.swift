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
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: blackColorOpacity, radius: shadowRadius, x:xBlack, y:yBlack)
            .shadow(color: whiteColorOpacity, radius: shadowRadius, x:xWhite, y:yWhite)
    }
}

struct ContainerView: View {
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
    var body: some View{
        RoundedRectangle(cornerRadius: 100.0)
        .fill(LinearGradient(Color.offGray, Color.offWhite))
        .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 2))
        .shadow(color: Color.white.opacity(0.7), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
    }
}

struct CustomAccountButton2:View {
    var body: some View{
        RoundedRectangle(cornerRadius: 15.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.white.opacity(0.7), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
    }
}

struct CustomTappedAccountButton:View {
    var body: some View{
        RoundedRectangle(cornerRadius: 100.0)
        .fill(LinearGradient(Color.offGray, Color.offWhite))
        .overlay(RoundedRectangle(cornerRadius: 100.0).stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 2))
        .shadow(color: Color.white.opacity(0.7), radius: 1, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 4, y: 4)
    }
}

struct CustomTappedAccountButton2:View {
    var body: some View{
        RoundedRectangle(cornerRadius: 150.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}

struct CustomTappedAccountButton3:View {
    var body: some View{
        RoundedRectangle(cornerRadius: 20.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.white.opacity(0.7), radius: 3, x: -5, y: -5)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 2.5, y: 2.5)
    }
}

struct CustomTappedAccountButton4:View {
    var body: some View{
        RoundedRectangle(cornerRadius: 10.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.white.opacity(0.7), radius: 2, x: -2, y: -2)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 1, y: 1)
    }
}

struct CustomTappedAccountButton5:View {
    var body: some View{
        RoundedRectangle(cornerRadius: 15.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.white.opacity(0.7), radius: 3, x: -5, y: -5)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: 2.5, y: 2.5)
    }
}


struct CustomTappedButtonsView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.offWhite)
            //            .fill(LinearGradient(gradient: Gradient(colors: [Color.tappedOffWhiteStart, Color.tappedOffWhiteEnd, Color.tappedOffWhiteStart]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .shadow(color: Color.black.opacity(0.2), radius: 7, x:-5, y:-5)
            .shadow(color: Color.white.opacity(0.7), radius: 7, x:7, y:7)
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.gray, lineWidth: 8)
                    .blur(radius: 4)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(Color.black, Color.clear)))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 25.0).fill(LinearGradient(Color.clear, Color.black)))
            )
    }
}

struct CustomAccountButtonsView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.black.opacity(0.2), radius: 3, x:-3, y:-3)
            .shadow(color: Color.white.opacity(0.7), radius: 3, x:6, y:6)
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(Color.gray, lineWidth: 2)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 100.0).fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(Circle().fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
    }
}

struct CustomAccountButtonsView2: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 100.0)
            .fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart))
            .shadow(color: Color.black.opacity(0.2), radius: 3, x:3, y:3)
            .shadow(color: Color.white.opacity(0.7), radius: 3, x:-6, y:-6)
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 100.0).fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:100.0)
                    .stroke(Color.gray, lineWidth: 2)
                    .blur(radius: 4)
                    .offset(x: 2, y: 2)
                    .mask(Circle().fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
    }
}

struct CustomPurchaseButtonsView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20.0)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.black.opacity(0.2), radius: 5, x:-5, y:-5)
            .shadow(color: Color.white.opacity(0.7), radius: 5, x:10, y:10)
            .overlay(
                RoundedRectangle(cornerRadius:20.0)
                    .stroke(Color.gray, lineWidth: 2)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 100.0).fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:20.0)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 20.0).fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.black.opacity(0.2), radius: 5, x:-2.5, y:-2.5)
            .shadow(color: Color.white.opacity(0.7), radius: 5, x:5, y:5)
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(Color.gray, lineWidth: 2)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView3: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart))
            .shadow(color: Color.white.opacity(0.7), radius: 3, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -2.5, y: -2.5)
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(Color.gray, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:20)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView4: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
            .shadow(color: Color.white.opacity(0.7), radius: 2, x: -2, y: -2)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 1, y: 1)
            .overlay(
                RoundedRectangle(cornerRadius:10)
                    .stroke(Color.gray, lineWidth: 2)
                    .blur(radius: 3)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:10)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
    }
}

struct CustomConfirmButtonsView5: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart))
            .shadow(color: Color.white.opacity(0.7), radius: 3, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 3, x: -2.5, y: -2.5)
            .overlay(
                RoundedRectangle(cornerRadius:15)
                    .stroke(Color.gray, lineWidth: 1)
                    .blur(radius: 3)
                    .offset(x: 2, y: 2)
                    .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.offGrayLinearEnd, Color.offGrayLinearStart)))
            )
            .overlay(
                RoundedRectangle(cornerRadius:15)
                    .stroke(Color.white, lineWidth: 4)
                    .blur(radius: 9)
                    .offset(x: -2, y: -2)
                    .mask(RoundedRectangle(cornerRadius: 15).fill(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)))
            )
    }
}

struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.darkEnd, Color.darkStart))
                    .overlay(shape.stroke(LinearGradient(Color.darkStart, Color.darkEnd), lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: 5, y: 5)
                    .shadow(color: Color.darkEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.darkStart, Color.darkEnd))
                    .overlay(shape.stroke(Color.darkEnd, lineWidth: 4))
                    .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                    .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            }
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
            .animation(nil)
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(LinearGradient(Color.offGray, Color.offWhite))
                    .overlay(shape.stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 4))
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(LinearGradient(Color.offGray, Color.offWhite))
                    .overlay(shape.stroke(LinearGradient(Color.offWhite, Color.offGray), lineWidth: 4))
                    .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
            }
        }
    }
}


struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(RoundedRectangle(cornerRadius: 20.0))
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: Circle())
        )
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

