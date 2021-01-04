//
//  FeaturedView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct FeaturedView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    TabView{
                        ForEach(0 ..< 5) { _ in
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Top Flowers")
                                            .bold()
                                        Text("White Rose")
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                            }
                        }
                        .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .tabViewStyle(PageTabViewStyle())
                TabView{
                    ForEach(0 ..< 5) { _ in
                        VStack(alignment: .leading){
                            Text("Top Stores")
                                .bold()
                            Text("Flowers Store Name")
                                .foregroundColor(.secondary)
                            HStack{
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    
                                VStack {
                                    HStack {
                                        Spacer()
                                        HStack {
                                            Text("See more")
                                            Image(systemName: "ellipsis")
                                        }
                                    }
                                    Divider()
                                    Spacer()
                                    Text("Kutuzovskaya 17")
                                        .foregroundColor(.secondary)
                                    Spacer()
                                }
                                .padding()
                                Spacer()
                            }}
                    }
                    .padding()
                }
                .frame(width: UIScreen.main.bounds.width, height: 210)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            }
            
            .navigationBarItems(trailing: NavigationLink(
                                    destination: AccountView(),
                                    label: {
                                        Text("Account")
                                            .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))
                                    }).animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5)))
            .navigationBarTitle("Main Page")
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
    }
}
