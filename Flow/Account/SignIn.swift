//
//  SignIn.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI
import AuthenticationServices

struct SignIn: View {
    var body: some View {
        VStack {
            SignInWithAppleButton(.signIn,
                  onRequest: { (request) in
                        request.requestedScopes = [.fullName, .email]
//                        request.nonce = myNonceString()
//                        request.state = myStateString()
                  },
                  onCompletion: { (result) in
                      switch result {
                      case .success(let authorization):
                          //Handle autorization
                          if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                              let userId = appleIDCredential.user
                              let identityToken = appleIDCredential.identityToken
                              let authCode = appleIDCredential.authorizationCode
                              let email = appleIDCredential.email
                              let givenName = appleIDCredential.fullName?.givenName
                              let familyName = appleIDCredential.fullName?.familyName
                              let state = appleIDCredential.state
                              // backend keychain
                          }
                          break
                      case .failure(let error):
                          //Handle error
                          break
                      }
                  })
        }.signInWithAppleButtonStyle(.whiteOutline).frame(width: 200, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
