//
//  BonusView.swift
//  Flow
//
//  Created by Vlad Novol on 10.01.2021.
//

import SwiftUI
import SceneKit

struct BonusView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var accountBonuses: Int
    
    var body: some View {
        VStack{
            HStack {
                Text("Balance")
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.gray)
                Spacer()
                Text("\(accountBonuses)")
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                }
            )
            HStack{
                Text("How it works")
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "chevron.right.2")
            }
            .padding()
            .frame(height: 67)
            .background(
                Group {
                    NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                }
            )
            Spacer()
            
        }
        .padding()
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
        .navigationBarTitle("Bonuses", displayMode: .inline)
    }
}

struct BonusView_Previews: PreviewProvider {
    static var previews: some View {
        BonusView(accountBonuses: 9999)
    }
}
