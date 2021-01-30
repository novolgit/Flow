//
//  RegistrationView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI

struct LoginView: View {
    @State private var accountName: String = ""
    @State private var accountPassword: String = ""
    @State private var accountPhone: String = ""
    @State private var accountEmail: String = ""
    
    var body: some View {
        ZStack{
          LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd)
            .ignoresSafeArea(edges: .all)
        VStack {
            Text("Flow")
                .font(.system(size: 50, weight: .bold, design: .serif))
                .foregroundColor(.offSecondaryGray)
                .padding()
            HStack{
                Image(systemName: "person")
                TextField("Account name", text: $accountName)
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
            HStack{
                Image(systemName: "phone")
                TextField("Phone", text: $accountPhone)
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.gray)
                    .disableAutocorrection(true)
                    .keyboardType(.phonePad)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    if accountPhone.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
            .padding(.vertical,3)
            HStack{
                Image(systemName: "envelope")
                TextField("Email", text: $accountEmail)
                    .font(.system(size: 20, design: .serif))
                    .foregroundColor(.gray)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    if accountEmail.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
            .padding(.vertical,3)
            HStack{
                Spacer()
                NavigationLink(
                    destination: RegistrationView(),
                    label: {
                        Text("Already have account?")
                            .foregroundColor(.blue)
                    })
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 8)
            SignIn()
        }
    }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
