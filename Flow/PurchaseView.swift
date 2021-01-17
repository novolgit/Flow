//
//  BinView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import MapKit

struct PurchaseView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var paymentType = 0
    @State private var showSort = false
    @State private var isSort = "name"
    
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach (isSort == "name" ? sortByNameList()[0].roses[0].shrubs[0..<3] : sortByPriceList()[0].roses[0].shrubs[0..<3]) { flower in
                            RowContentView(flower: $modelData.flowers[0].roses[0].shrubs[getIndex(flower: flower)],flowers: $modelData.flowers[0].roses[0].shrubs, isSet: $modelData.flowers[0].roses[0].shrubs[getIndex(flower: flower)].isSelected)
                                .frame(height: UIScreen.main.bounds.height*0.125)
                                .padding()
                        }
                        VStack{}.frame(height: UIScreen.main.bounds.height*0.06)
                        VStack {
                            NavigationLink(destination: ConfirmView(totalPrice: calculateTotalPrice(), coordinate: modelData.stores[0].locationCoordinate, coordinateName: modelData.stores[0].name),
                                           label: {
                                            Text("Confirm")
                                                .font(.system(size: 24, weight: .medium, design: .serif))
                                                .foregroundColor(!detectChoose() ? Color.gray.opacity(0.3) : Color.gray)
    //                                                !detectChoose() ? Color(#colorLiteral(red: 0.5470548868, green: 0.001177539467, blue: 0.2447426915, alpha: 0.2349739327)) : Color(#colorLiteral(red: 0.5470548868, green: 0.001177539467, blue: 0.2447426915, alpha: 1)))
                                           })
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .frame(width: UIScreen.main.bounds.width*0.60, height: UIScreen.main.bounds.height*0.12)
                                .contentShape(RoundedRectangle(cornerRadius: 15.0))
                                .background(
                                    Group {
                                        if detectChoose(){
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
                        VStack{}.frame(height: 35)
                    }
//                    .background(
//                        Group {
//                            NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
//                        }
//                    )
//                    .padding()
                    VStack{}.frame(height: 20)
                }
            }
            .navigationBarTitle("Purchase", displayMode: .inline)
            .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
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
            $0.roses[0].shrubs[0].price < $1.roses[0].shrubs[0].price
        }
    }
    
    func sortByNameList() -> [Flower] {
        
        return modelData.flowers.sorted {
            $0.roses[0].shrubs[0].name < $1.roses[0].shrubs[0].name
        }
    }
    
    func calculateTotalPrice()->Double{
        
        var price : Double = 0
        
        modelData.flowers[0].roses[0].shrubs.forEach { (flower) in
            if flower.isSelected {
                price += Double(flower.price)
            }
        }
        
        return price
    }
    
    func detectChoose()->Bool{
        
        var isSelected : Bool = false
        
        modelData.flowers[0].roses[0].shrubs.forEach { (flower) in
            if flower.isSelected {
                isSelected = true
            }
        }
        
        return isSelected
    }
    
    func getIndex(flower: Shrub)->Int{
        
        return modelData.flowers[0].roses[0].shrubs.firstIndex { (flower1) -> Bool in
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
