//
//  FeaturedView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import MapKit

struct FeaturedView: View {
    @EnvironmentObject var modelData: ModelData
    var chart: Chart
    
    @State var featuredIndex = 1
    @State var topStoresIndex = 1
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack{}.frame(height: 30)
                    HStack {
                        Text("Featured")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "tablecells")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    FeaturedTabView(index: featuredIndex)
                        .animation(.easeOut)
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    HStack {
                        Text("Charts")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "hand.tap")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    ChartView(chart: modelData.charts[0])
                    HStack {
                        Text("Nearly Stores")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "scroll")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    NearlyStores()
                        .padding()
                    HStack {
                        Text("Top Stores")
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "tablecells")
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    TopStoresTabView(index: topStoresIndex)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.28)
                        .animation(.easeOut)
                }
                VStack{}.frame(height: 30)
            }
            .navigationBarItems(trailing: NavigationLink(
                                    destination: AccountView(account: ModelData().accounts[0]),
                                    label: {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .frame(width:30,height:30)
                                            //                                            .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))
                                            .frame(width: 34, height: 34)
                                            .background(
                                                Group {
                                                    NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                                }
                                            )
                                        
                                    })
            )
            .navigationBarTitle("Featured", displayMode: .inline)
            .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
        }
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(chart: ModelData().charts[0])
            .environmentObject(ModelData())
    }
}
