//
//  BlurView.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI

struct BlurView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
        
    }
}

struct ForTestView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var press = false
    @State var press2 = false
    @State var press3 = false
    
    var body: some View {
        ZStack{
            LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
//            HStack {
//                Text("Toggle")
//                    .padding()
//            Toggle(isOn: $press) {
//            }
//            .toggleStyle(CustomToggleStyle(size: 60))
//            }
//            .offset(y: 0)
//            .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
//
//            HStack {
//                Text("Toggle 2")
//                    .padding(8)
//            Toggle(isOn: $press2) {
//            }
//            .toggleStyle(CustomToggleStyle2(size: 60))
//            }
//            .offset(y: 120)
//            .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
            
//            HStack {
//                Text("Toggle 3")
//                    .padding(8)
//            Toggle(isOn: $press3) {
//            }
//            .toggleStyle(PressToggleStyle(imageSize: 20, offsetValue: 16, toggleWidth: 80, toggleHeight: 40, borderWidth: 70, borderHeight: 30, image: "heart", imageFill: "heart.fill", lightColor: Color.redd, darkColor: Color.reddDark, lineWidth: 0.5))
//            .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
//            }
//            HStack {
//                Text("Button")
//                    .padding()
//                CustomButtonStyle(size: 60)
//            }
//            .offset(y: -120)
//            .animation(.easeInOut)
            
//            HStack {
//                Text("Button 2")
//                    .padding(8)
//                CustomButtonStyle2(size: 60)
//            }
//            .offset(y: -240)
//            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
        }
    }
}

struct ForTestView_Previews: PreviewProvider {
    static var previews: some View {
        ForTestView()
            .preferredColorScheme(.dark)
    }
}
