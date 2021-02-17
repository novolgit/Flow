//
//  Test.swift
//  Flow
//
//  Created by Vlad Novol on 01.02.2021.
//

import Foundation
import SwiftUI

struct Test: View {
//    @State var name: String = ""
//    @State var phone: String = ""
//    @State var bio: String = ""
//    @State var profileImage: String = ""
//    @State var bonuses: Int = 0
//    @State var email: String = ""
//    @State var password: String = ""
//    @State var confirmPassword: String = ""
//
//    @State var showSignUpForm = true
//    @State var showDetails = false
//
//    @ObservedObject var sessionStore = SessionStore()
//    @State var profile: AccountFirebase?
    
    var body: some View {
        Text("das")
//        NavigationView {
//          VStack {
//            if self.showSignUpForm {
//              Form {
//                Section {
//                  TextField("name", text: $name)
//                    .textContentType(.givenName)
//                }
//                Section {
//                  TextField("Email", text: $email)
//                    .textContentType(.emailAddress)
//                    .autocapitalization(.none)
//                  SecureField("Password", text: $password)
//                  SecureField("Confirm password", text: $confirmPassword)
//                }
//                Button(action: { self.signUp() }) {
//                  Text("Sign up")
//                }
//              }
//              .navigationBarTitle("Sign up")
//            }
//            else {
//              Form {
//                TextField("Email", text: $email)
//                  .textContentType(.emailAddress)
//                  .autocapitalization(.none)
//                SecureField("Password", text: $password)
//                Button(action: { self.signIn() }) {
//                  Text("Sign in")
//                }
//              }
//              .navigationBarTitle("Sign in")
//            }
//            Button(action: { self.showSignUpForm.toggle() }) {
//              Text(self.showSignUpForm ? "Have an account? Sign in instead." : "No account yet? Click here to sign up instead.")
//            }
//          }
//          .sheet(isPresented: $showDetails) {
//            UserProfileView(userProfile: self.profile ??  AccountFirebase(uid: "", name: "", phone: "", bio: "", profileImage: "", bonuses: 0))
          }
//        }
//      }
//
//      func signUp() {
//        sessionStore.signUp(email: self.email, password: self.password, name: self.name, phone: self.phone, bio: self.bio, profileImage: self.profileImage, bonuses: self.bonuses) { (profile, error) in
//          if let error = error {
//            print("Error when signing up: \(error)")
//            return
//          }
//          self.profile = profile
//          self.showDetails.toggle()
//        }
//      }
//
//      func signIn() {
//        sessionStore.signIn(email: self.email, password: self.password) { (profile, error) in
//          if let error = error {
//            print("Error when signing up: \(error)")
//            return
//          }
//          self.profile = profile
//          self.showDetails.toggle()
//        }
//    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

//struct UserProfileView: View {
//  var userProfile: AccountFirebase
//
//  var body: some View {
//        Text("Hello \(userProfile.name)")
//  }
//}
