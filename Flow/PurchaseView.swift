//
//  BinView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import MapKit

struct PurchaseView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var paymentType = 0
    @State private var showSort = false
    @State private var isSort = "name"
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView(showsIndicators: false) {
                    HStack{
                        Spacer()
                        Image(systemName: "hand.draw")
                            .rotation3DEffect(
                                .degrees(180),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .padding([.top, .leading, .trailing])
                    LazyVStack(spacing: 0) {
                        ForEach(
//                            isSort == "name" ?
                            sortByNameList()[0..<3]
//                                    : sortByPriceList()
                        ) { flower in
                            RowContentView(flower: $modelData.flowers[getIndex(flower: flower)],flowers: $modelData.flowers, isSet: $modelData.flowers[getIndex(flower: flower)].isSelected)
                                .frame(height: 85)
                                .padding(14)
                        }
                        VStack{}.frame(height: UIScreen.main.bounds.height*0.06)
                        VStack {
                            HStack {
                                Spacer()
                                NavigationLink(destination: ConfirmView(totalPrice: calculateTotalPrice(), coordinate: modelData.stores[0].locationCoordinate, coordinateName: modelData.stores[0].name),
                                               label: {
                                                HStack {
                                                    Text("Confirm")
                                                        .font(.system(size: 26, weight: .regular, design: .serif))
                                                        .foregroundColor( colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                                                    Image(systemName: "arrow.right")
                                                        .font(.system(size: 20, weight: .light, design: .serif))
                                                        .foregroundColor( colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                                                }
                                               })
                                    .frame(width: 190, height: 70)
                                    .background(
                                        Group {
                                                    CustomConfirmButtonsView3()
                                            }
                                )
                            }
                            
                        }
                        .scaleEffect(detectChoose() ? 1 : 0)
                        .animation(.spring())
                        .padding(.trailing)
                        VStack{}.frame(height: 35)
                    }
//                    .background(
//                        Group {
//                            NeuButtonsView2(radius: 25, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
//                        }
//                    )
//                    .padding()
                    VStack{}.frame(height: 20)
                }
            }
            .navigationBarTitle("Purchase", displayMode: .inline)
            .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .navigationBarItems(
                leading: VStack {
                    Text(String(calculateTotalPrice())).animation(.spring(response: 0.1, dampingFraction: 1, blendDuration: 1))
                        .font(.title)
                        .transition(.opacity)
                        .id("RowContent" + String(calculateTotalPrice()))
                },
                trailing: HStack {
                    Spacer()
                    Menu("Sort") {
                        Button("Name", action: {
                            isSort = "name"
                        })
                        Button("Price", action: {
                            isSort = "price"
                        })
                        Button("Color", action: {})
                    }
                }
            )
        }
    }
    
    func sortByPriceList() -> [Flower] {
        
        return modelData.flowers.sorted {
            $0.price < $1.price
        }
    }
    
    func sortByNameList() -> [Flower] {
        
        return modelData.flowers.sorted {
            $0.name < $1.name
        }
    }
    
    func calculateTotalPrice()->Double{
        
        var price : Double = 0
        
        modelData.flowers.forEach { (flower) in
            if flower.isSelected {
                price += Double(flower.price)
            }
        }
        
        return price
    }
    
    func detectChoose()->Bool{
        
        var isSelected : Bool = false
        
        modelData.flowers.forEach { (flower) in
            if flower.isSelected {
                isSelected = true
            }
        }
        
        return isSelected
    }
    
    func getIndex(flower: Flower)->Int{
        
        return modelData.flowers.firstIndex { (flower1) -> Bool in
            return flower.id == flower1.id
        } ?? 0
    }
}

struct BinView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseView()
            .environmentObject(ModelData())
    }
}
