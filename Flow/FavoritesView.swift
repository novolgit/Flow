//
//  FavoritesView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var columnsStores = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var columnsFlowers = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var isMoreStores = false
    @State var isMoreFlowers = false

    var body: some View {
        NavigationView{
        ScrollView(showsIndicators: false) {
            VStack {
                HStack{
                    Text("Favorite Stores")
                        .foregroundColor(.offSecondaryGray)
                        .font(.system(size: 34, weight: .bold, design: .serif))
                    Spacer()
                    
                    Button {
                        withAnimation(.spring()){
                            if self.columnsStores.count == 2{
                                self.columnsStores.removeLast()
                            }
                            else{
                                self.columnsStores.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                    } label: {
                        Image(systemName: self.columnsStores.count == 2 ? "rectangle.grid.2x2" : "rectangle.grid.1x2")
                            .font(.system(size: 24))
                            .rotationEffect(.degrees(self.columnsStores.count == 2 ? 0 : 360))
                            .foregroundColor(.offSecondaryGray)
                    }
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                        }
                    )
                }
                .padding(.horizontal)
                .padding(.top,25)
                LazyVGrid(columns: self.columnsStores,spacing: 25){
                    ForEach(modelData.stores[isMoreStores ? 0..<5 : 0..<2]){store in
                        StoreGridView(columns: self.$columnsStores, store: store)
                    }
                }
                .padding(.bottom, 14)
                Button(action: {
                    isMoreStores = !isMoreStores
                }, label: {
                    Image(systemName: isMoreStores ? "chevron.up" : "chevron.down")
                        .font(.system(size: 22, weight: .bold, design: .serif))
                        .foregroundColor(isMoreStores ? .offSecondaryGray : .gray)

                })
                .frame(width: UIScreen.main.bounds.width*0.15, height: 45)
                .foregroundColor(.gray)
                .contentShape(RoundedRectangle(cornerRadius: 15.0))
                .background(
                    Group {
                        if !isMoreStores{
                            Group {
                                CustomTappedAccountButton3()
                            }
                        } else{
                            Group {
                                CustomConfirmButtonsView3()
                            }
                        }
                    }
                )
            }
            .padding()
            VStack {
                HStack{
                    Text("Favorite Flowers")
                        .foregroundColor(.offSecondaryGray)
                        .font(.system(size: 34, weight: .bold, design: .serif))
                    Spacer()
                    
                    Button {
                        withAnimation(.spring()){
                            if self.columnsFlowers.count == 2{
                                self.columnsFlowers.removeLast()
                            }
                            else{
                                self.columnsFlowers.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                    } label: {
                        Image(systemName: self.columnsFlowers.count == 2 ? "rectangle.grid.2x2" : "rectangle.grid.1x2")
                            .rotationEffect(.degrees(self.columnsFlowers.count == 2 ? 0 : 360))
                            .font(.system(size: 24))
                            .foregroundColor(.offSecondaryGray)
                    }
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                        }
                    )
                }
                .padding(.horizontal)
                LazyVGrid(columns: self.columnsFlowers,spacing: 25){
                    ForEach(modelData.flowers[isMoreFlowers ? 0..<5 : 0..<2]){flower in
                        FlowerGridView(columns: self.$columnsFlowers, flower: flower)
                    }
                }
                .padding(.bottom, 14)
                Button(action: {
                    isMoreFlowers = !isMoreFlowers
                }, label: {
                    Image(systemName: isMoreFlowers ? "chevron.up" : "chevron.down")
                        .font(.system(size: 22, weight: .bold, design: .serif))
                        .foregroundColor(isMoreFlowers ? .offSecondaryGray : .gray)

                })
                .frame(width: UIScreen.main.bounds.width*0.15, height: 45)
                .foregroundColor(.gray)
                .contentShape(RoundedRectangle(cornerRadius: 15.0))
                .background(
                    Group {
                        if !isMoreFlowers{
                            Group {
                                CustomTappedAccountButton3()
                            }
                        } else{
                            Group {
                                CustomConfirmButtonsView3()
                            }
                        }
                    }
                )
            }
            .padding()
            }
        .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
        .navigationBarTitle("Favorites", displayMode: .inline)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(ModelData())
    }
}
