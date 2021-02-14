//
//  AccountView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI

struct AccountView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var accountCreation = AccountCreationViewModel()
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var userName = UserDefaults.standard.value(forKey: "userName") as? String ?? "Account"
    @State var userBonuses = UserDefaults.standard.value(forKey: "userBonuses") as? Int ?? 0
    @State var userPhone = UserDefaults.standard.value(forKey: "userPhNumber") as? String ?? ""
    @State var userImage = UserDefaults.standard.value(forKey: "userImage") as? Array<Any> ?? [0]
//    @AppStorage("userStatus") var userStatus = false
//    @AppStorage("current_user") var userName = ""
//    @AppStorage("current_phone") var userPhone = ""
//    @AppStorage("current_bonuses") var userBonuses = 0
//    @AppStorage("current_bio") var userBio = ""
//    @AppStorage("current_image") var userImage = ""
    
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
                                            .font(.system(size: 30, weight: .regular, design: .serif))
                                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        Text("Bonuses")
                                            .font(.system(size: 20, weight: .light, design: .serif))
                                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                                    
                                    if status {
                                        if userImage.isEmpty {
                                        ZStack {
                                            Image(systemName: "plus.circle")
                                                .resizable()
                                                .font(.system(size: 30, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                                .frame(width: 60/2, height: 60/2)
                                                .frame(width:130/2, height: 130/2)
                                                .offset(x: accountCreation.pageNumber != 2 ? 30 : 0, y: accountCreation.pageNumber != 2 ? -30 : 0)
                                                .scaleEffect(CGSize(width: accountCreation.pageNumber == 2 ? 0.0 : 1.0, height:  accountCreation.pageNumber == 2 ? 0.0 : 1.0))
                                                .animation(.spring())
                                            Image(systemName: "person")
                                                .resizable()
                                                .font(.system(size: 30, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                                        Image("\(userImage[0])")
                                            .resizable()
                                            .clipShape(Circle())
                                            .frame(width:120, height: 120)
                                            .frame(width:130, height: 130)
                                            .background(
                                                Group {
                                                    CustomAccountButtonsView()
                                                }
                                            )
                                            .onTapGesture {
                                                accountCreation.picker.toggle()}
                                    }
                                } else {
                                    Image(systemName: "person")
                                        .resizable()
                                        .font(.system(size: 30, weight: .light, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
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
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                            )
                            ZStack{}.frame(height:10)
                            LazyVGrid(columns: columns, alignment: .center, spacing: 30) {
                                Section{
                                    NavigationLink(
                                        destination: SettingsView(accountName: userName, accountPhone: userPhone)){
                                        VStack{
                                            Image(systemName: "gearshape.2")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            Text("Settings")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        }
                                                                            .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                        .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                        .background(
                                            Group {
                                                NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                            }
                                        )
                                    }
                                    NavigationLink(
                                        destination: AboutUsView()){
                                        VStack{
                                            Image(systemName: "archivebox")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            Text("History")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: AboutUsView()){
                                        VStack{
                                            Image(systemName: "person.2")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            Text("About us")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: PromoView()){
                                        VStack{
                                            Image(systemName: "gift")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            Text("Promo")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: PromoView()){
                                        VStack{
                                            Image(systemName: "star")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            Text("Favorites")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                    NavigationLink(
                                        destination: PromoView()){
                                        VStack{
                                            Text("F")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            Text("Rate Us")
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width*0.312, height: 135)
                                    .contentShape(RoundedRectangle(cornerRadius: 20.0))
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -5, yWhite: -5)
                                        }
                                    )
                                }
                                .padding()
//                                .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                            }
                            .frame(width: UIScreen.main.bounds.width*0.90)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
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
                        .navigationBarTitle(status ? userName : "Account", displayMode: .inline)
                        .toolbar(content: {
                            if !status {
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
                    .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
                    .onAppear {
                                  
                                  NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                                      
                                     let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                                         
                                      self.status = status
                                  }
                              }
//                    .onAppear() {
//                        self.accountCreation.subscribe()
//                    }
    }
}

struct AccountView_Previews: PreviewProvider {
    
    static var previews: some View {
        AccountView()
    }
}
