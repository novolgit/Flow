//
//  AccountView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI

struct AccountView: View {
    @StateObject var accountCreation = AccountCreationViewModel()
    
    @AppStorage("log_Status") var userStatus = false
    @AppStorage("current_user") var userName = ""
    @AppStorage("current_phone") var userPhone = ""
    @AppStorage("current_bonuses") var userBonuses = 0
    @AppStorage("current_bio") var userBio = ""
    @AppStorage("current_image") var userImage = ""
    
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    @State private var isToggled = false
    
//    var account: AccountFirebase
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            HStack{
                                NavigationLink(
                                    destination: BonusView(accountBonuses: accountCreation.bonuses)){
                                    VStack {
                                        Text("\(userBonuses)")
                                            .font(.system(size: 30, design: .serif))
                                            .foregroundColor(.gray)
                                        Text("Bonuses")
                                            .font(.system(size: 20, design: .serif))
                                            .foregroundColor(.gray)
                                    }
                                    .frame(width:130, height: 130)
                                    .background(
                                        Group {
                                            CustomAccountButtonsView()
                                        }
                                    )
                                }
                                Spacer()
                                VStack{
                                    
                                    if userStatus {
                                    if accountCreation.accountImage[0].count == 0 {
                                        ZStack {
                                            Image(systemName: "plus.circle")
                                                .resizable()
                                                .foregroundColor(.gray)
                                                .frame(width: 60/2, height: 60/2)
                                                .frame(width:130/2, height: 130/2)
                                                .offset(x: accountCreation.pageNumber != 2 ? 30 : 0, y: accountCreation.pageNumber != 2 ? -30 : 0)
                                                .scaleEffect(CGSize(width: accountCreation.pageNumber == 2 ? 0.0 : 1.0, height:  accountCreation.pageNumber == 2 ? 0.0 : 1.0))
                                                .animation(.spring())
                                            Image(systemName: "person")
                                                .resizable()
                                                .foregroundColor(.gray)
                                                .frame(width: 60, height: 60)
                                                .frame(width:130, height: 130)
                                        }
                                        .background(
                                            Group {
                                                CustomAccountButtonsView()
                                            }
                                    )
                                        .onTapGesture {
                                            accountCreation.picker.toggle()}
                                    }
                                    else{
                                        Image("120x120")
                                            .resizable()
                                            .clipShape(Circle())
                                            .frame(width:200, height: 200)
                                            .onTapGesture {
                                                accountCreation.picker.toggle()}
                                    }
                                } else {
                                    Image(systemName: "person")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .frame(width: 60, height: 60)
                                        .frame(width:130, height: 130)
                                        .background(
                                            Group {
                                                CustomAccountButtonsView()
                                            }
                                        )
                                }
                            }
                            }
                            .padding(25)
                            .frame(width: UIScreen.main.bounds.width*0.90, height: UIScreen.main.bounds.height*0.25)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                                }
                            )
                            ZStack{}.frame(height:10)
                            LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                                Section{
                                    NavigationLink(
                                        destination: SettingsView(accountName: userName, accountPhone: userPhone)){
                                        VStack{
                                            Image(systemName: "gearshape.2")
                                            Text("Settings")
                                                .font(.system(size: 16, design: .serif))
                                        }
                                                                            .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                        .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                        .background(
                                            Group {
                                                NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                            }
                                        )
                                    }
                                    NavigationLink(
                                        destination: AboutUsView()){
                                        VStack{
                                            Image(systemName: "archivebox")
                                            Text("History")
                                                .font(.system(size: 16, design: .serif))
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: AboutUsView()){
                                        VStack{
                                            Image(systemName: "person.2")
                                            Text("About us")
                                                .font(.system(size: 16, design: .serif))
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: PromoView()){
                                        VStack{
                                            Image(systemName: "gift")
                                            Text("Promo")
                                                .font(.system(size: 16, design: .serif))
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: PromoView()){
                                        VStack{
                                            Image(systemName: "star")
                                            Text("Favorites")
                                                .font(.system(size: 16, design: .serif))
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: PromoView()){
                                        VStack{
                                            Text("F")
                                                .font(.system(size: 18, weight: .bold, design: .serif))
                                            Text("Rate Us")
                                                .font(.system(size: 16, design: .serif))
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                }
                                .padding()
//                                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                            }
                            .frame(width: UIScreen.main.bounds.width*0.90)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                                }
                                )
                            ZStack{}.frame(height:20)
                            HStack {
                                Text("Privacy Policy")
                                    .foregroundColor(.blue)
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width*0.90)
                        }
                        .padding()
                        .navigationBarTitle(userStatus ? userName : "Account" , displayMode: .inline)
                        .toolbar(content: {
                            if !userStatus {
                            NavigationLink(
                                destination: LoginView(),
                                label: {
                                    Text("Sign In")
                                })
                            } else {
                            Button(
                                action: accountCreation.signOut,
                                label: {
                                    Text("Sign Out")
                                })
                            }
                        })
                    }
                    .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
                    .onAppear() {
                        self.accountCreation.subscribe()
                    }
    }
}

struct AccountView_Previews: PreviewProvider {
    
    static var previews: some View {
        AccountView()
    }
}
