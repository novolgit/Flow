//
//  FeaturedView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct FeaturedView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                VStack {
                    TabView{
                        ForEach(modelData.flowers) { flower in
                            VStack{
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(flower.name)
                                            .bold()
                                        Text(flower.descriptions)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                VStack {
                                    Image(flower.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.width*0.9, height: 230)
       
                                }
                                .frame(width: UIScreen.main.bounds.width*0.92, height: 230)
                                .background(ZStack {
                                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9168236852, green: 0.8474225402, blue: 0.9500675797, alpha: 1)), Color(#colorLiteral(red: 0.8919499516, green: 0.819306314, blue: 0.9098219275, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                                    RoundedRectangle(
                                        cornerRadius: 16, style:
                                        .continuous)
                                        .foregroundColor(.white)
                                        .blur(radius: 2)
                                        .offset(x:-20, y:-20)
                                    
                                    RoundedRectangle(
                                        cornerRadius: 16, style:
                                        .continuous)
                                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.984113276, green: 0.7994782925, blue: 0.984026134, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .padding(2)
                                        .blur(radius: 2)
                                        .offset(x:-10, y:-10)
                                })
                                .clipShape(RoundedRectangle(
                                    cornerRadius: 16, style: .continuous
                                ))
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
            .environmentObject(ModelData())
    }
}
