//
//  AccountSettingsView.swift
//  Flow
//
//  Created by Vlad Novol on 21.01.2021.
//

import SwiftUI

struct AccountSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var userName = UserDefaults.standard.value(forKey: "userName") as? String ?? "Account"
    
    @State private var changeAccountText: String = ""
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading) {
                    Text("Your current account name")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Text(userName)
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
                Spacer()
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 20, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
            }
            .frame(width: UIScreen.main.bounds.width*0.83, height: 70)
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                }
            )
            Spacer()
        }
        .padding()
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
        .navigationBarTitle(userName, displayMode: .inline)
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}
