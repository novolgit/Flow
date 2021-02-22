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
    
    @State var userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var userName = UserDefaults.standard.value(forKey: "userName") as? String ?? ""
    @State var userBonuses = UserDefaults.standard.value(forKey: "userBonuses") as? Int ?? 0
    @State var userImage = UserDefaults.standard.value(forKey: "userImage") as? Array<Any> ?? [0]
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    @State private var isToggled = false
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
                    ScrollView(showsIndicators: false) {
                        VStack {
                            HStack{
                                    VStack {
                                        Text(userStatus ? "\(userBonuses)" : "0")
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
                                Spacer()
                                VStack{
                                    if userStatus {
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
                                    }
                                    else{
                                        Image(uiImage: loadImageFromDiskWith(fileName: "profileImage.jpg") ?? UIImage(named: "120x120_clear")!)
                                            .resizable()
                                            .clipShape(Circle())
                                            .frame(width:120, height: 120)
                                            .frame(width:130, height: 130)
                                            .background(
                                                Group {
                                                    CustomAccountButtonsView()
                                                }
                                            )
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
                                        destination: SettingsView()){
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
                                        destination: HistoryView()){
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
                                }
                                .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width*0.90)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                                )
                            ZStack{}.frame(height:20)
                            HStack {
                                Link("Privacy Policy", destination: URL(string: "https://flow-d5b9a.web.app/privacy-policy.html")!)
                                    .foregroundColor(.blue)
                                
                                Spacer()
                            }
                            .frame(width: UIScreen.main.bounds.width*0.90)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .padding()
                        .navigationBarTitle(userStatus ? userName : "Account", displayMode: .inline)
                        .toolbar(content: {
                            if !userStatus {
                            NavigationLink(
                                destination: LoginView(),
                                label: {
                                    Text("Sign In")
                                        .font(.system(size: 20, weight: .light, design: .serif))
                                        .foregroundColor( colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                                })
                            } else {
                            Button(
                                action: accountCreation.signOut,
                                label: {
                                    Text("Sign Out")
                                        .font(.system(size: 20, weight: .light, design: .serif))
                                        .foregroundColor( colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                                })
                            }
                        })
                    }
                    .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
                    .onAppear {
                        
                        let userName = UserDefaults.standard.value(forKey: "userName") as? String ?? ""
                       
                         self.userName = userName
                        
                                  NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                                     let userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                                    
                                      self.userStatus = userStatus
                                    
                                  }
                              }
    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image

        }

        return nil
    }
}

struct AccountView_Previews: PreviewProvider {
    
    static var previews: some View {
        AccountView()
    }
}
