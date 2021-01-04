//
//  AccountView.swift
//  Flow
//
//  Created by Vlad Novol on 04.01.2021.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
                ScrollView {
                    VStack {
                        HStack{
                            Text("1078 Bonuses")
                            Spacer()
                            Image("spy")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 5)
                        }
                        .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                        Divider()
                        Section{
                            NavigationLink(
                                destination: SettingsView()){
                                HStack{
                                    Image(systemName: "gearshape.2")
                                    Spacer()
                                    Text("Settings")
                                }
                            }
                            Divider()
                            NavigationLink(
                                destination: SettingsView()){
                                HStack{
                                    Image(systemName: "archivebox")
                                    Spacer()
                                    Text("History")
                                }
                            }
                            Divider()
                            HStack{
                                Image(systemName: "archivebox")
                                Spacer()
                                Text("History")
                            }
                            Divider()
                        }
                        .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5))
                        .padding(8)
                        Spacer()
                        HStack {
                            Text("Privacy Policy")
                                .foregroundColor(.blue)
                            Spacer()
                        }
                    }
                    .padding()
                    .navigationBarTitle("Account", displayMode: .inline)
                    .toolbar { EditButton() }
//                    .navigationBarItems(trailing: Button(action: {
//
//                    }, label: {
//                        Text("Edit")
//                    }))
                }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
