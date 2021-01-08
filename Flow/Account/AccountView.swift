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
            ScrollView(showsIndicators: false) {
                    VStack {
                        HStack{
                            Text("1078 Bonuses")
                            Spacer()
                            Image("spy")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
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
                                Image(systemName: "person.2")
                                Spacer()
                                Text("About us")
                            }
                            Divider()
                            HStack{
                                Image(systemName: "gift")
                                Spacer()
                                Text("Promo")
                            }
                            Divider()
                            HStack{
                                Spacer()
                                Text("Logout")
                                Image(systemName: "arrow.uturn.right")
                            }
                            .frame(width: 300, height: 20, alignment: .center)
                            .shadow(color: Color.gray, radius: 10, x:10, y:10)
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
