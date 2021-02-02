//
//  AboutUsView.swift
//  Flow
//
//  Created by Vlad Novol on 10.01.2021.
//

import SwiftUI

struct AboutUsView: View {
//  @ObservedObject var modelData = ModelData() // (/1)
  
  var body: some View {
    Text("About Us")
//    NavigationView {
//        List(modelData.accountsFirebase) { account in // (2)
//        VStack(alignment: .leading) {
//            Text(account.name)
//            .font(.headline)
//            Text(account.bio)
//            .font(.subheadline)
//            Text("phone \(account.phone)")
//            .font(.subheadline)
//        }
//      }
//      .navigationBarTitle("Users")
//      .onAppear() { // (3)
//        self.modelData.fetchData()
//      }
//    }
  }
}

struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
