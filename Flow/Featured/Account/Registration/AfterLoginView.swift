//
//  AfterLoginView.swift
//  Flow
//
//  Created by Vlad Novol on 2/17/21.
//

import SwiftUI

struct AfterLoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var startAnimationBox = false
    @State var startAnimationText = false
    
    var body: some View {
        ZStack {
            LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color(#colorLiteral(red: 0.8077717423, green: 0.8078888059, blue: 0.8077461123, alpha: 1)), colorScheme == .dark ? Color.offGrayLinearEndDark : Color(#colorLiteral(red: 0.8077717423, green: 0.8078888059, blue: 0.8077461123, alpha: 1)))
                .ignoresSafeArea(edges: .all)
            VStack {
                HStack {
                    Text("Welcome to ")
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Text("Flow")
                        .font(.system(size: 40, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
                .scaleEffect(!startAnimationText ? 0 : 1)
                ZStack {
                    Image("korobka1")
                        .resizable()
                        .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .opacity(startAnimationBox ? 1 : 0)
                        .offset(y: startAnimationBox ? 30 : 0)
                        .scaleEffect(startAnimationBox ? 1.1 : 1)
                        .animation(.spring(response: 1, dampingFraction: 0.4))
                    Image("korobka2")
                    .resizable()
                    .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .opacity(startAnimationBox ? 0 : 1)
                        .offset(y: startAnimationBox ? 0 : 30)
                        .animation(.spring(response: 1, dampingFraction: 0.4))
                }
            }
            .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.3))
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.76) {
                self.startAnimationBox = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
