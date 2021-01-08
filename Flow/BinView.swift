//
//  BinView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import MapKit

struct BinView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var paymentType = 0
    @State private var showSort = false
    
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                VStack {
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach (modelData.flowers[0..<9]) { flower in
                                RowContent(flower: $modelData.flowers[getIndex(flower: flower)],flowers: $modelData.flowers)
                                    .frame(height: 60)
                            }
                        }
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9924681783, green: 0.9031314254, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8958731294, blue: 0.9988654256, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                        .clipShape(RoundedRectangle(
                            cornerRadius: 16, style: .continuous
                        ))
                        .shadow(color: Color(#colorLiteral(red: 0.9089812636, green: 0.8349509239, blue: 0.9271947145, alpha: 1)), radius: 10, x:0, y:10)
                        VStack{}.frame(height: 50)
                        VStack {
                            Button(action: {
                            }, label: {
                                Text("Confirm order")
                                    .foregroundColor(.black)
                            })
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .frame(width: 200, height: 60)
                            .background(ZStack {
                                Color(#colorLiteral(red: 0.9031798244, green: 0.7894607782, blue: 0.9329212308, alpha: 1))
                                RoundedRectangle(
                                    cornerRadius: 16, style:
                                        .continuous)
                                    .foregroundColor(.white)
                                    .blur(radius: 4)
                                    .offset(x:0, y:-4)
                                
                                RoundedRectangle(
                                    cornerRadius: 16, style:
                                        .continuous)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.995506227, green: 0.9856465459, blue: 1, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom))
                                    .padding(10)
                                    .blur(radius: 2)
                                    .offset(x:-0, y:-20)
                            })
                            .clipShape(RoundedRectangle(
                                cornerRadius: 16, style: .continuous
                            ))
                                                                            .shadow(color: Color(#colorLiteral(red: 0.9853917956, green: 0.9568484426, blue: 1, alpha: 1)), radius: 20, x:0, y:20)
//                                                                            .shadow(color: Color(#colorLiteral(red: 0.9488424659, green: 0.9950810075, blue: 0.9850104451, alpha: 1)), radius: 20, x:-20, y:-20)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        //                                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9708308578, green: 0.8894047737, blue: 0.9957606196, alpha: 1)), Color(#colorLiteral(red: 0.9872573018, green: 0.9068536758, blue: 1, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                        .edgesIgnoringSafeArea(.all)
                    }
                    //                .background(ZStack {
                    //                    Color(#colorLiteral(red: 0.9031798244, green: 0.7894607782, blue: 0.9329212308, alpha: 1))
                    //                    RoundedRectangle(
                    //                        cornerRadius: 16, style:
                    //                        .continuous)
                    //                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9249141812, green: 0.831048429, blue: 0.9850493073, alpha: 1)), Color(#colorLiteral(red: 0.9872573018, green: 0.9068536758, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    //                        .padding(4)
                    //                        .blur(radius: 2)
                    //                        .offset(x:0, y:0)
                    //                })
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .navigationBarTitle("Purchase")
            .navigationBarItems(
                leading: Text(calculateTotalPrice())
                    .font(.title),
                trailing: HStack {
                        Spacer()
                        Menu("Sort") {
                            Button("Name", action: {})
                            Button("Price", action: {})
                            Button("Color", action: {})
                        }
                        
                    }
            )
        }
    }
    
    func calculateTotalPrice()->String{
        
        var price : Double = 0
        
        modelData.flowers.forEach { (flower) in
            price += Double(flower.price)
        }
        
        return getPrice(value: price)
    }
    
    func getIndex(flower: Flower)->Int{
        
        return modelData.flowers.firstIndex { (flower1) -> Bool in
            return flower.id == flower1.id
        } ?? 0
    }
}

func getPrice(value: Double)->String{
    
    let format = NumberFormatter()
    format.numberStyle = .currency
    
    return format.string(from: NSNumber(value: value)) ?? ""
}
//        NavigationView{
//            ScrollView(showsIndicators: false) {
//                    ForEach(modelData.flowers[0..<15]) { flower in
//                        NavigationLink(destination: ConfirmView()) {
//                            Section {
//                                HStack {
//                                    Text(flower.name)
//                                        .foregroundColor(.black)
//                                    Spacer()
//                                    Text(String(flower.price) + "$")
//                                        .foregroundColor(.black)
//                                }
//                                .padding()
//                            }
//                        }
//                        .animation(.easeIn)
//                    }
//                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9924681783, green: 0.9031314254, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8958731294, blue: 0.9988654256, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .clipShape(RoundedRectangle(
//                        cornerRadius: 16, style: .continuous
//                    ))
//                    .shadow(color: Color(#colorLiteral(red: 0.9089812636, green: 0.8349509239, blue: 0.9271947145, alpha: 1)), radius: 10, x:10, y:10)
//                    VStack{}.frame(height: 30)
//                    VStack {
//                        Button(action: {
//                        }, label: {
//                            Text("Confirm order")
//                                .foregroundColor(.black)
//                        })
//                        .font(.system(size: 20, weight: .semibold, design: .rounded))
//                        .frame(width: 200, height: 60)
//                        .background(ZStack {
//                            Color(#colorLiteral(red: 0.9031798244, green: 0.7894607782, blue: 0.9329212308, alpha: 1))
//                            RoundedRectangle(
//                                cornerRadius: 16, style:
//                                .continuous)
//                                .foregroundColor(.white)
//                                .blur(radius: 4)
//                                .offset(x:-6, y:-6)
//
//                            RoundedRectangle(
//                                cornerRadius: 16, style:
//                                .continuous)
//                                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.995506227, green: 0.9856465459, blue: 1, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                                .padding(2)
//                                .blur(radius: 2)
//                                .offset(x:-8, y:-8)
//                        })
//                        .clipShape(RoundedRectangle(
//                            cornerRadius: 16, style: .continuous
//                        ))
//                        .shadow(color: Color(#colorLiteral(red: 0.9924681783, green: 0.9031314254, blue: 1, alpha: 1)), radius: 20, x:20, y:20)
//                        .shadow(color: Color(#colorLiteral(red: 0.9872573018, green: 0.9068536758, blue: 1, alpha: 1)), radius: 20, x:-20, y:-20)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9708308578, green: 0.8894047737, blue: 0.9957606196, alpha: 1)), Color(#colorLiteral(red: 0.9872573018, green: 0.9068536758, blue: 1, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
//                    .edgesIgnoringSafeArea(.all)
//                }
//                .padding()
//                .background(ZStack {
//                    Color(#colorLiteral(red: 0.9031798244, green: 0.7894607782, blue: 0.9329212308, alpha: 1))
//                    RoundedRectangle(
//                        cornerRadius: 16, style:
//                        .continuous)
//                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9249141812, green: 0.831048429, blue: 0.9850493073, alpha: 1)), Color(#colorLiteral(red: 0.9872573018, green: 0.9068536758, blue: 1, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                        .padding(4)
//                        .blur(radius: 2)
//                        .offset(x:0, y:0)
//                })
//                .cornerRadius(20)
//                .navigationTitle("My Purchases")
//                .navigationBarItems(
//                    trailing: HStack {
//                        Spacer()
//                        Menu("Sort") {
//                            Button("Name", action: {})
//                            Button("Price", action: {})
//                            Button("Color", action: {})
//                        }
//
//                    }
//                )
//        }
//
//    }


struct BinView_Previews: PreviewProvider {
    static var previews: some View {
        BinView()
            .environmentObject(ModelData())
    }
}


struct RowContent : View {
    @Binding var flower: Flower
    @Binding var flowers: [Flower]
    
    @State var offset = CGSize.zero
    @State var offsetY : CGFloat = 0
    @State var scale : CGFloat = 0.5
    
    var body : some View {
        GeometryReader { geo in
            HStack (spacing : 0){
                HStack{
                    Text(flower.name)
                    Spacer()
                    Text(String(flower.price) + "$")
                }
                .padding()
                .frame(width : geo.size.width, alignment: .leading)
                ZStack {
                    Image(systemName: "trash")
                        .font(.system(size: 20))
                        .scaleEffect(scale)
                }
                .frame(width: 60, height: geo.size.height)
                .background(Color.purple.opacity(0.15))
                .onTapGesture {
                    withAnimation(.spring()){deleteItem()}
                }
                ZStack {
                    Image(systemName: "app.gift.fill")
                        .font(.system(size: 20))
                        .overlay(
                            Image(systemName: "star")
                                .font(.system(size: 10))
                                .offset(y: self.offsetY)
                        )
                }
                .frame(width: 60, height: geo.size.height)
                .background(Color.red.opacity(0.15))
                .onTapGesture {
                    // TO DO add to favorites
                }
            }
            .background(Color.secondary.opacity(0.1))
            .offset(self.offset)
            .gesture(DragGesture()
                        .onChanged { gestrue in
                            self.offset.width = gestrue.translation.width
                        }
                        .onEnded { _ in
                            if self.offset.width < -50 {
                                self.scale = 1
                                self.offset.width = -120
                                self.offsetY = -20
                            } else {
                                self.scale = 0.5
                                self.offset = .zero
                                self.offsetY = 0
                                
                            }
                        }
            )
            Divider()
        }
    }
    
    func deleteItem(){
        flowers.removeAll { (flower) -> Bool in
            return self.flower.id == flower.id
        }
    }
}
