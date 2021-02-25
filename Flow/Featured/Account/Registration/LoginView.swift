//
//  RegistrationView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI
import Firebase
import Combine

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var accountCreation = AccountCreationViewModel()
    
    @State var userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var startAnimationText: Bool = false
    @State var logoAnimate: Bool = false
    @State var endAnimate: Bool = false
    
    var body: some View {
        VStack{
            if userStatus{
                ZStack {
                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                    VStack {
                        HStack {
                            Text("Welcome to ")
                                .font(.system(size: 40, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Text("FLos")
                                .font(.system(size: 40, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .scaleEffect(!startAnimationText ? 0 : 1)
                        ZStack{
                            Text("F")
                                .font(.system(size: 260, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                                .offset(x: !logoAnimate ? -70 : 0)
                                .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                                  axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                                .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                            Text("L")
                                .font(.system(size: 260, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: -2.5, y: -2.5)
                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 2.5, x: 1.25, y: 1.25)
                                .offset(x: !logoAnimate ? 70 : 0)
                                .scaleEffect(!logoAnimate ? 0.9 : 1.2)
                                .rotation3DEffect(Angle.degrees(logoAnimate ? 180 : 0),
                                                  axis: (x: 0.0, y: 1.0, z: 0.0))
                        }
                        .frame(width: 380, height: 380)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 500, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                            }
                        )
                        .ignoresSafeArea(.all, edges: .all)
                    }
                    .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 1))
                }
                .navigationBarHidden(true)
                .statusBar(hidden: true)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                            logoAnimate.toggle()
                        withAnimation(Animation.linear(duration: 1)) {
                            endAnimate.toggle()
                        }
                        
                        self.startAnimationText = true
                    }
                }
            }
            else{
                ZStack{
                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                        .ignoresSafeArea(edges: .all)
                    VStack{
                        MainView()
                            .environmentObject(accountCreation)
                        Spacer()
                        VStack{
                            Text("By signing in you accept our ")
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            HStack{
                                Link("Terms of Use ", destination: URL(string: "https://flow-d5b9a.web.app/terms-of-use.html")!)
                                    .foregroundColor(.blue)
                                Text("and ")
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                Link("Privacy Policy", destination: URL(string: "https://flow-d5b9a.web.app/privacy-policy.html")!)
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.bottom)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                        }
                    if accountCreation.isLoading{
                        CustionProgressView(frame: 100, fontSize: 50, offset: 15)
                    }
                }
                .animation(.spring(response: 0.6, dampingFraction: 0.8))
                .navigationTitle("")
                .navigationBarHidden(true)
            }
        }
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                let userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.userStatus = userStatus
            }
        }
    }
    
//    public func introspectTabBarController(customize: @escaping (UITabBarController) -> ()) -> some View {
//        return inject(UIKitIntrospectionViewController(
//            selector: { introspectionViewController in
//
//                // Search in ancestors
//                if let navigationController = introspectionViewController.tabBarController {
//                    return navigationController
//                }
//
//                // Search in siblings
//                return Introspect.previousSibling(ofType: UITabBarController.self, from: introspectionViewController)
//            },
//            customize: customize
//        ))
//    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Button(action: {
                        if accountCreation.pageNumber == 0{
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        else if accountCreation.pageNumber == 1{
                            accountCreation.pageNumber -= 1
                        }
                        else{
                            accountCreation.pageNumber -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    })
                    Spacer()
                    if accountCreation.pageNumber == 2 {
                        Button(action: {
                            accountCreation.signUp()
                        }, label: {
                            Text("Skip")
                                .font(.system(size: 22, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        })
                    }
                }
                .padding()
                Spacer()
            }
            VStack{
                Text("Flow")
                    .font(.system(size: 40, weight: .black, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .padding()
                if accountCreation.pageNumber == 0{
                    Login()
                }
                else if accountCreation.pageNumber == 1{
                    Register()
                        .transition(.move(edge: .trailing))
                }
                else{
                    ImageRegister()
                }
            }
        }
        .alert(isPresented: $accountCreation.alert, content: {
            Alert(title: Text("Error"), message: Text(accountCreation.alertMsg), dismissButton: .default(Text("Ok")))
        })
    }
}

struct Login: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    @State private var numberLimit = 11
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "phone")
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                TextField("Phone", text: $accountCreation.phNumber)
                    .onReceive(Just(accountCreation.phNumber)) { _ in limitNumber(numberLimit) }
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .foregroundColor(.gray)
                    .disableAutocorrection(true)
                    .keyboardType(.phonePad)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    if !accountCreation.phNumber.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal)
            .padding(.vertical,3)
            HStack {
                Spacer()
                Button(action: accountCreation.login, label: {
                    HStack{
                        Spacer()
                        Text("Next")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                })
                .foregroundColor(accountCreation.phNumber == "" ? .gray : .offSecondaryGray)
                .padding()
                .frame(height: 70)
                .background(
                    Group {
                        CustomConfirmButtonsView5()
                    }
                )
                .padding(.horizontal)
                .padding(.vertical,3)
                .scaleEffect(CGSize(width: accountCreation.phNumber == "" ? 0.0 : 1.0, height:  accountCreation.phNumber == "" ? 0.0 : 1.0))
                .animation(.spring())
            }
            Text("Or sign in with")
                .font(.system(size: 22, weight: .medium, design: .serif))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
            SignInWithAppleView()
                .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.vertical)
                .padding(.horizontal, 50)
        }
    }
    
    func limitNumber(_ upper: Int) {
        if accountCreation.phNumber.count > upper {
            accountCreation.phNumber = String(accountCreation.phNumber.prefix(upper))
        }
    }
}

struct Register: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person")
                    .font(.system(size: 18, weight: .light, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                TextField("Name", text: $accountCreation.name)
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .foregroundColor(.gray)
                    .disableAutocorrection(true)
            }
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    if !accountCreation.name.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal)
            .padding(.vertical,3)
            HStack{
                VStack {
                    Image(systemName: "info")
                        .font(.system(size: 18, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .padding(.top, 13)
                    Spacer()
                }
                TextEditor(text: $accountCreation.bio)
                    .font(.system(size: 20, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .foregroundColor(.gray)
                    .lineSpacing(5)
            }
            .padding()
            .frame(height: 150)
            .background(
                Group {
                    if !accountCreation.bio.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal)
            .padding(.vertical,3)
            Button(action: {accountCreation.pageNumber = 2}, label: {
                HStack{
                    Spacer()
                    Text("Next")
                        .font(.system(size: 20, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 18, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                }
            })
            .foregroundColor(accountCreation.name == "" ? .gray : .offSecondaryGray)
            .padding()
            .frame(height: 70)
            .background(
                Group {
                    CustomConfirmButtonsView5()
                }
            )
            .padding(.horizontal)
            .padding(.vertical,3)
            .scaleEffect(CGSize(width: accountCreation.name == "" ? 0.0 : 1.0, height:  accountCreation.name == "" ? 0.0 : 1.0))
            .animation(.spring())
        }
    }
}

struct ImageRegister: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    @State var currentImage = 0
    
    var body: some View {
        VStack{
            Text("Add Profile Picture")
                .font(.system(size: 24, weight: .medium, design: .serif))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                .padding()
            VStack{
                if accountCreation.accountImage[0].count == 0{
                    ZStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            .frame(width: 60/2, height: 60/2)
                            .frame(width:130/2, height: 130/2)
                            .offset(x: 30, y: -30)
                            .animation(.spring())
                        Image(systemName: "person")
                            .resizable()
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            .frame(width: 60, height: 60)
                            .frame(width:130, height: 130)
                    }
                    .background(
                        Group {
                            CustomAccountButtonsView()
                        }
                    )
                    .padding()
                }
                else{
                    Image(uiImage: UIImage(data: accountCreation.accountImage[0])!)
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width:200, height: 200)
                        .padding()
                }
            }
            .onTapGesture {
                accountCreation.picker.toggle()
            }
            HStack {
                Spacer()
                Button(action: accountCreation.signUp, label: {
                    HStack{
                        Spacer()
                        Text("Registrate")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                })
                .foregroundColor(accountCreation.name == "" ? .gray : .offSecondaryGray)
                .padding()
                .frame(height: 70)
                .background(
                    Group {
                        CustomConfirmButtonsView5()
                    }
                )
                .padding(.horizontal)
                .padding(.vertical,3)
                .scaleEffect(CGSize(width: accountCreation.accountImage[0].count == 0 ? 0.0 : 1.0, height:  accountCreation.accountImage[0].count == 0 ? 0.0 : 1.0))
                .animation(.spring())
            }
        }
        .sheet(isPresented: $accountCreation.picker, content: {
            ImagePicker(show: $accountCreation.picker, ImageData: $accountCreation.accountImage[currentImage])
        })
    }
}
