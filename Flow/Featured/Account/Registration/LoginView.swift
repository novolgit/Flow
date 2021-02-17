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
    @State var startAnimationBox = false
    @State var startAnimationText = false
    
    
    var body: some View {
        VStack{
            if userStatus{
                ZStack {
                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color(#colorLiteral(red: 0.8077717423, green: 0.8078888059, blue: 0.8077461123, alpha: 1)), colorScheme == .dark ? Color.offGrayLinearEndDark : Color(#colorLiteral(red: 0.8077717423, green: 0.8078888059, blue: 0.8077461123, alpha: 1)))
                        .ignoresSafeArea(edges: .all)
                    VStack {
                        HStack {
                            Text("Welcome to ")
                                .font(.system(size: 40, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            Text("Flow")
                                .font(.system(size: 40, weight: .bold, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                        .scaleEffect(!startAnimationText ? 0 : 1)
                        ZStack {
                            Image("korobka1")
                                .resizable()
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .opacity(startAnimationBox ? 1 : 0)
                                .offset(y: startAnimationBox ? 30 : 0)
                                .scaleEffect(startAnimationBox ? 1.1 : 1)
                                .animation(.spring(response: 1, dampingFraction: 0.4))
                            Image("korobka2")
                                .resizable()
                                .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .opacity(startAnimationBox ? 0 : 1)
                                .offset(y: startAnimationBox ? 0 : 30)
                                .animation(.spring(response: 1, dampingFraction: 0.4))
                        }
                    }
                    .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.3))
                }
                .navigationBarHidden(true)
                .statusBar(hidden: true)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        self.startAnimationBox = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.startAnimationText = true
                    }
                }
            }
            else{
                ZStack{
                    LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd)
                        .ignoresSafeArea(edges: .all)
                    MainView()
                        .environmentObject(accountCreation)
                    if accountCreation.isLoading{
                        ProgressView()
                    }
                }
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
            Text("Or register with")
                .font(.system(size: 22, weight: .medium, design: .serif))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
            //                .padding()
            SignInWithAppleView()
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
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
            ZStack{
                HStack {
                    Button(action: {
                        accountCreation.pageNumber -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    })
                    Spacer()
                }
                .padding()
                .offset(y: -243)
            }
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
            ZStack{
                HStack {
                    Button(action: {
                        accountCreation.pageNumber -= 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    })
                    Spacer()
                    Button(action: {
                        accountCreation.signUp()
                    }, label: {
                        Text("Skip")
                            .font(.system(size: 22, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    })
                }
                .padding()
                .offset(y: -207)
            }
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
            Text("By signing in you accept our Terms of Use and Privacy Policy")
                .padding()
                .multilineTextAlignment(.center)
        }
        .sheet(isPresented: $accountCreation.picker, content: {
            ImagePicker(show: $accountCreation.picker, ImageData: $accountCreation.accountImage[currentImage])
        })
    }
}
