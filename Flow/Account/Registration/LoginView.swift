//
//  RegistrationView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI
import Firebase
import PhotosUI
import Combine

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var accountCreation = AccountCreationViewModel()
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        VStack{
                if status{
                    Text("Logged Successfully")
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
                          
                         let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                             
                          self.status = status
                      }
                  }
//            HStack{
//                Image(systemName: "phone")
//                TextField("Phone", text: $accountPhone)
//                    .font(.system(size: 20, design: .serif))
//                    .foregroundColor(.gray)
//                    .disableAutocorrection(true)
//                    .keyboardType(.phonePad)
//            }
//            .padding()
//            .frame(height: 70)
//            .background(
//                Group {
//                    if accountPhone.isEmpty {CustomConfirmButtonsView5()}
//                    else {CustomTappedAccountButton5()}
//                }
//            )
//            .padding(.horizontal,22)
//            .padding(.vertical,3)
//            HStack{
//                Image(systemName: "envelope")
//                TextField("Email", text: $accountEmail)
//                    .font(.system(size: 20, design: .serif))
//                    .foregroundColor(.gray)
//                    .disableAutocorrection(true)
//                    .keyboardType(.emailAddress)
//            }
//            .padding()
//            .frame(height: 70)
//            .background(
//                Group {
//                    if accountEmail.isEmpty {CustomConfirmButtonsView5()}
//                    else {CustomTappedAccountButton5()}
//                }
//            )
//            .padding(.horizontal,22)
//            .padding(.vertical,3)
//            HStack{
//                Spacer()
//                NavigationLink(
//                    destination: RegistrationView(),
//                    label: {
//                        Text("Already have account?")
//                            .foregroundColor(.blue)
//                    })
//            }
//            .padding(.horizontal, 22)
//            .padding(.vertical, 8)
//            SignIn()
//        }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//    }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var accountCreation : AccountCreationViewModel
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        VStack{
            
            Text("Flow")
                .font(.system(size: 40, weight: .black, design: .serif))
                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
            ZStack{

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
        // alert...
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
                    if accountCreation.phNumber.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
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
                        CustomTappedAccountButton5()
                    }
                )
                .padding(.horizontal,22)
                .padding(.vertical,3)
                    .scaleEffect(CGSize(width: accountCreation.phNumber == "" ? 0.0 : 1.0, height:  accountCreation.phNumber == "" ? 0.0 : 1.0))
                .animation(.spring())
            }
            
            SignIn()
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
                    if accountCreation.phNumber.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
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
                    if accountCreation.phNumber.isEmpty {CustomConfirmButtonsView5()}
                    else {CustomTappedAccountButton5()}
                }
            )
            .padding(.horizontal,22)
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
                CustomTappedAccountButton5()
            }
        )
        .padding(.horizontal,22)
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
                                        .offset(x: accountCreation.pageNumber != 2 ? 30 : 0, y: accountCreation.pageNumber != 2 ? -30 : 0)
                                        .scaleEffect(CGSize(width: accountCreation.pageNumber == 2 ? 0.0 : 1.0, height:  accountCreation.pageNumber == 2 ? 0.0 : 1.0))
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
                            }
                            else{
                                Image(uiImage: UIImage(data: accountCreation.accountImage[0])!)
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width:200, height: 200)
                                
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
                            CustomTappedAccountButton5()
                        }
                    )
                    .padding(.horizontal,22)
                    .padding(.vertical,3)
                    .scaleEffect(CGSize(width: accountCreation.accountImage[0].count == 0 ? 0.0 : 1.0, height:  accountCreation.accountImage[0].count == 0 ? 0.0 : 1.0))
                .animation(.spring())
            }
        }
        .toolbar(content: {
            HStack{
                Spacer()
                Button(action: accountCreation.signUp, label: {
                    Text("Skip")
                        .font(.system(size: 18, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                })
                .padding()
            }
        })
        .sheet(isPresented: $accountCreation.picker, content: {
            
            ImagePicker(show: $accountCreation.picker, ImageData: $accountCreation.accountImage[currentImage])
        })
    }
}

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var show: Bool
    @Binding var ImageData: Data
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        let controller = PHPickerViewController(configuration: PHPickerConfiguration())
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
        
    }
    
    class Coordinator: NSObject,PHPickerViewControllerDelegate{
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            if !results.isEmpty{
                
                if results.first!.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    results.first!.itemProvider.loadObject(ofClass: UIImage.self) { (image, _) in
                        
                        guard let imageData = image else{return}
                        
                        let data = (imageData as! UIImage).jpegData(compressionQuality: 0.5)!
                        
                        DispatchQueue.main.async {
                            
                            self.parent.ImageData = data
                            self.parent.show.toggle()
                        }
                    }
                }
                else{
                    self.parent.show.toggle()
                }
            }
            else{
                self.parent.show.toggle()
            }
        }
    }
}
