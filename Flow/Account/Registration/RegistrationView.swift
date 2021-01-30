//
//  RegistrationView.swift
//  Flow
//
//  Created by Vlad Novol on 29.01.2021.
//

import SwiftUI

struct RegistrationView: View {
    @State private var accountName: String = ""
    @State private var accountPassword: String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)
                .ignoresSafeArea(edges: .all)
            VStack {
                VStack {
                    Text("Flow")
                        .font(.system(size: 50, weight: .bold, design: .serif))
                        .foregroundColor(.offSecondaryGray)
                        .padding()
                    HStack{
                        Image(systemName: "person")
                        TextField("Name, Email or Phone", text: $accountName)
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            .disableAutocorrection(true)
                    }
                    .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            if accountName.isEmpty {CustomConfirmButtonsView5()}
                            else {CustomTappedAccountButton5()}
                        }
                    )
                    .padding(.horizontal,22)
                    .padding(.vertical,3)
                    HStack{
                        Image(systemName: "key")
                        SecureField("Password", text: $accountPassword)
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.gray)
                            .disableAutocorrection(true)
                    }
                    .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            if accountPassword.isEmpty {CustomConfirmButtonsView5()}
                            else {CustomTappedAccountButton5()}
                        }
                    )
                    .padding(.horizontal,22)
                    .padding(.vertical,3)
                    if !accountName.isEmpty || !accountPassword.isEmpty {
                        Button(action: {
                        }, label: {
                            Text("Sign In")
                                .foregroundColor(.gray)
                                .font(.system(size: 24, weight: .medium, design: .serif))
                            
                        })
                        .frame(width: 250, height: 60)
                        .background(
                            Group {
                                CustomTappedAccountButton3()
                            }
                    )
                        .padding()
                    }
                }
                .frame(minHeight: 0, maxHeight: .infinity)
                Text("By signing in you accept our Terms of Use and Privacy Policy")
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
