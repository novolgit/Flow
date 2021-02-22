import SwiftUI


struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var userName = UserDefaults.standard.value(forKey: "userName") as? String ?? ""
    @State var userBonuses = UserDefaults.standard.value(forKey: "userBonuses") as? Int ?? 0
    @State var userPhone = UserDefaults.standard.value(forKey: "userPhNumber") as? String ?? ""
    @State var userImage = UserDefaults.standard.value(forKey: "userImage") as? Array<Any> ?? [0]
    @State var userMail = UserDefaults.standard.value(forKey: "userMail") as? String ?? ""
    @State var userPass = UserDefaults.standard.value(forKey: "userPass") as? String ?? ""
    
    var body: some View {
        ScrollView{
            VStack{
                NavigationLink(
                    destination: AccountSettingsView(),
                    label: {
                        HStack{
                            Text("Name")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            HStack {
                                Text(userStatus ? userName : "")
                                    .font(.system(size: 20, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20, weight: .light, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            }
                        }
                    })
                    .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                HStack{
                    Text("Email")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Spacer()
                    HStack {
                        if userMail == "Add Email" {
                            NavigationLink(
                                destination: EmailAddView(),
                                label: {
                                    Text(userStatus ? userMail : "")
                                        .font(.system(size: 20, weight: .regular, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                    Image(systemName: "square.and.pencil")
                                        .font(.system(size: 20, weight: .light, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                })
                        } else {
                            NavigationLink(
                                destination: EmailChangeView(),
                                label: {
                                    Text(userMail)
                                        .font(.system(size: 20, weight: .regular, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 20, weight: .light, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                })
                        }
                    }
                }
                .padding()
                .frame(height: 70)
                .background(
                    Group {
                        NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                    }
                )
                NavigationLink(
                    destination: PhoneChangeView(),
                    label: {
                        HStack{
                            Text("Phone")
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Spacer()
                            HStack {
                                Text(userStatus ? userPhone : "")
                                    .font(.system(size: 20, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20, weight: .light, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            }
                        }
                    })
                    .padding()
                    .frame(height: 70)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                        }
                    )
                if !userPass.isEmpty {
                    NavigationLink(
                        destination: PasswordChangeView(),
                        label: {
                            HStack{
                                Text("Password")
                                    .font(.system(size: 20, weight: .regular, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                Spacer()
                                Image(systemName: "square.and.pencil")
                                    .font(.system(size: 20, weight: .light, design: .serif))
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            }
                        })
                        .padding()
                        .frame(height: 70)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 3, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                            }
                        )
                }
            }
            .frame(width: UIScreen.main.bounds.width*0.90)
            .padding()
            .navigationBarTitle("Settings", displayMode: .inline)
        }
        .onAppear{
            let userName = UserDefaults.standard.value(forKey: "userName") as? String ?? ""
           
            self.userName = userName
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView()
    }
}
