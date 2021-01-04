//
//  ProfileView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            ScrollView {
              Text("SwiftUI on iPad!")
                Text("Matvey lox")
                .font(.headline)
            
            }
            .navigationBarTitle("chto-to")
    
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
