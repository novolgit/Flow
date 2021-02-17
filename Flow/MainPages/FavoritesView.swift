//
//  FavoritesView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State var columnsStores = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var columnsFlowers = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var flowerID = Flower.ID()
    @State private var isMoreStores = false
    @State private var isMoreFlowers = false
    @State private var showFavoritesFlowerOnly = false
    @State private var showFavoritesStoreOnly = false
    
    var filteredStores: [Store] {
        modelData.stores.filter { store in
            (showFavoritesStoreOnly || store.isSelected)
        }
    }
    var filteredFlowers: [Flower] {
        modelData.flowers.filter { flower in
            (showFavoritesFlowerOnly || flower.isSelected)
        }
    }
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack{
                        Text("Favorite Stores")
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 28, weight: .black, design: .serif))
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
                                .font(.system(size: 24, weight: .light, design: .serif))
                                .rotationEffect(.degrees(self.columnsStores.count == 2 ? 0 : 360))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        }
                        .frame(width: 50, height: 50)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                            }
                        )
                    }
                    .padding(.horizontal)
                    .padding(.top,25)
                    if filteredStores.isEmpty {
                        VStack {
                            Text("You haven't Favorite Stores yet...")
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .padding()
                            HStack {
                                Spacer()
                                HStack {
                                    NavigationLink(
                                        destination: StoresDetailView(),
                                        label: {
                                            Text("See all Stores")
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                                .font(.system(size: 20, weight: .light, design: .serif))
                                        })
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        .font(.system(size: 20, weight: .ultraLight, design: .serif))
                                }
                                .padding()
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.1)
                                .background(
                                    Group {
                                        CustomConfirmButtonsView3()
                                    }
                                )
                            }
                        }
                        .padding()
                    } else {
                        LazyVGrid(columns: self.columnsStores,spacing: 25){
                            ForEach(filteredStores[isMoreStores ? 0..<filteredStores.count : filteredStores.count == 1 ? 0..<1 : 0..<2]){store in
                                StoreGridView(columns: self.$columnsStores, store: store)
                            }
                        }
                        .padding(.bottom, 14)
                        .animation(.spring())
                    }
                    if !filteredStores.isEmpty {
                        HStack {
                            HStack {
                                NavigationLink(
                                    destination: StoresDetailView(),
                                    label: {
                                        Text("More stores")
                                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            .font(.system(size: 16, weight: .light, design: .serif))
                                    })
                                Image(systemName: "arrow.right")
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                    .font(.system(size: 22, weight: .ultraLight, design: .serif))
                            }
                            .padding()
                            .frame(height: 45)
                            .background(
                                Group {
                                    CustomTappedAccountButton4()
                                }
                            )
                            Spacer()
                            Button(action: {
                                isMoreStores = !isMoreStores
                            }, label: {
                                HStack {
                                    Text(!isMoreStores ? "All" : "Less")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        .font(.system(size: 16, weight: .light, design: .serif))
                                    Image(systemName: isMoreStores ? "chevron.up" : "chevron.down")
                                        .font(.system(size: 22, weight: .ultraLight, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                }
                                
                            })
                            .frame(width: UIScreen.main.bounds.width*0.25, height: 45)
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            .background(
                                Group {
                                    if !isMoreStores{
                                        Group {
                                            CustomTappedAccountButton4()
                                        }
                                    } else{
                                        Group {
                                            CustomConfirmButtonsView4()
                                        }
                                    }
                                }
                            )
                        }
                        .padding()
                    }
                }
                .padding()
                VStack {
                    HStack{
                        Text("Favorite Flowers")
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 28, weight: .black, design: .serif))
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
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                .font(.system(size: 24, weight: .light, design: .serif))
                        }
                        .frame(width: 50, height: 50)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1.125, xBlack: 2.5, yBlack: 2.5, xWhite: -1.125, yWhite: -1.125)
                            }
                        )
                    }
                    .padding(.horizontal)
                    if filteredFlowers.isEmpty {
                        VStack {
                            Text("You haven't Favorite Flowers yet...")
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                .font(.system(size: 20, weight: .regular, design: .serif))
                                .padding()
                            HStack {
                                Spacer()
                                HStack {
                                    NavigationLink(
                                        destination: AssortmentDetailsView(),
                                        label: {
                                            Text("See all Flowers")
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                                .font(.system(size: 20, weight: .light, design: .serif))
                                        })
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        .font(.system(size: 20, weight: .ultraLight, design: .serif))
                                }
                                .padding()
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.1)
                                .background(
                                    Group {
                                        CustomConfirmButtonsView3()
                                    }
                                )
                            }
                        }
                        .padding()
                    } else {
                        LazyVGrid(columns: self.columnsFlowers,spacing: 25){
                            ForEach(filteredFlowers[isMoreFlowers ? 0..<filteredFlowers.count : filteredFlowers.count == 1 ? 0..<1 : 0..<2]){flower in
                                FlowerGridView(columns: self.$columnsFlowers, flower: flower)
                            }
                        }
                        .padding(.bottom, 14)
                        .animation(.spring())
                    }
                    if !filteredFlowers.isEmpty {
                        HStack {
                            HStack {
                                NavigationLink(
                                    destination: AssortmentDetailsView(),
                                    label: {
                                        Text("More flowers")
                                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                            .font(.system(size: 16, weight: .light, design: .serif))
                                    })
                                Image(systemName: "arrow.right")
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                    .font(.system(size: 22, weight: .ultraLight, design: .serif))
                            }
                            .padding()
                            .frame(height: 45)
                            .background(
                                Group {
                                    CustomTappedAccountButton4()
                                }
                            )
                            Spacer()
                            Button(action: {
                                isMoreFlowers = !isMoreFlowers
                            }, label: {
                                HStack {
                                    Text(!isMoreFlowers ? "All" : "Less")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                        .font(.system(size: 16, weight: .ultraLight, design: .serif))
                                    Image(systemName: isMoreFlowers ? "chevron.up" : "chevron.down")
                                        .font(.system(size: 22, weight: .ultraLight, design: .serif))
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                }
                                
                            })
                            .frame(width: UIScreen.main.bounds.width*0.25, height: 45)
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                            .background(
                                Group {
                                    if !isMoreFlowers{
                                        Group {
                                            CustomTappedAccountButton4()
                                        }
                                    } else{
                                        Group {
                                            CustomConfirmButtonsView4()
                                        }
                                    }
                                }
                            )
                        }
                        .padding()
                    }
                }
                .padding()
            }
            .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .navigationBarTitle("Favorites", displayMode: .inline)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(ModelData())
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}
