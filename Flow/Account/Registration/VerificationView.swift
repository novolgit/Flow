//
//  VerificationView.swift
//  Flow
//
//  Created by Vlad Novol on 31.01.2021.
//

import SwiftUI
import Firebase

struct VerificationView: View {
    @State var code = ""
    @Binding var show : Bool
    @Binding var ID : String
    @State var msg = ""
    @State var alert = false
    
    var body: some View {
        VStack(spacing: 20){
             
             Image("pic")
             
             Text("Verification Code").font(.largeTitle).fontWeight(.heavy)
             
             Text("Please Enter The Verification Code")
                 .font(.body)
                 .foregroundColor(.gray)
                 .padding(.top, 12)

             TextField("Code", text: self.$code)
                     .keyboardType(.numberPad)
                     .padding()
                     .background(Color("Color"))
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     .padding(.top, 15)

             
             Button(action: {
                 
                let credential =  PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                 
                 Auth.auth().signIn(with: credential) { (res, err) in
                     
                     if err != nil{
                         
                         self.msg = (err?.localizedDescription)!
                         self.alert.toggle()
                         return
                     }
                     
                     UserDefaults.standard.set(true, forKey: "status")
                     
                     NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                 }
                 
             }) {
                 
                 Text("Verify").frame(width: UIScreen.main.bounds.width - 30,height: 50)
                 
             }.foregroundColor(.white)
             .background(Color.orange)
             .cornerRadius(10)
             .navigationBarTitle("")
             .navigationBarHidden(true)
             .navigationBarBackButtonHidden(true)
        }
        .alert(isPresented: $alert) {
                
            Alert(title: Text("Error"), message: Text(self.msg), dismissButton: .default(Text("Ok")))
        }
    }
}
