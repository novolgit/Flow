//
//  AccountSettingsView.swift
//  Flow
//
//  Created by Vlad Novol on 21.01.2021.
//

import SwiftUI

struct AccountSettingsView: View {
    var accountName: String
    @State private var changeAccountText: String = ""
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading) {
                    Text("Your current account name")
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                    Text(accountName)
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.red)
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width*0.83, height: 70)
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                }
            )
            HStack{
                VStack(alignment: .leading){
                    Text("Change account Name")
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                    TextField("Enter your new account name", text: $changeAccountText)
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.gray)
                        .keyboardType(.default)
                    Divider()
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width*0.83, height: 70)
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                }
            )
            Spacer()
        }
        .padding()
        .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
        .navigationBarTitle("Name", displayMode: .inline)
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView(accountName: "Vlad")
    }
}
