//
//  IndicatorView.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI

struct IndicatorView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var currentPage: Int
    
    var body: some View {
        ZStack{
            Circle()
                .stroke()
                .frame(width: 300, height: 300)
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                .opacity(0)
                .frame(width: 320, height: 320)
            
            ForEach(0..<30) {
                Circle()
                    .frame(width: 3, height: 3)
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .offset(y: -150)
                    .rotationEffect(.degrees(Double($0) * 6))
                    .opacity(0.2)
            }
            .rotationEffect(.degrees(90))
                ForEach(0..<4){
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .offset(y: -150)
                        .rotationEffect(.degrees(Double($0) * 60))
            }
                .rotationEffect(.degrees(90))
                
                ZStack{
                    Rectangle()
                        .frame(width: 140.5, height: 1)
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .offset(x: -80)
                    
                    Image(systemName: "circle.dashed")
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .frame(width: 16, height: 16)
                        .offset(x: -150)
                }
                .rotationEffect(.degrees(Double(currentPage*(-60))))
                .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1))
                Image(systemName: "timelapse")
                    .frame(width: 20, height: 20)
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .rotationEffect(.degrees(Double(currentPage*(-60))))
                    .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
        }
        .frame(width: 400, height: 202)
    }
}



struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView(currentPage: 1)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
