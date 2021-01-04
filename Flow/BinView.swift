//
//  BinView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import MapKit

struct BinView: View {
    
    @State private var paymentType = 0
    @State private var showSort = false
    
    let backgroundPinkColor = UIColor(red: 0.95, green: 0.815, blue: 0.815, alpha: 1).cgColor
    
    var data = ["1", "2", "3"]

    
    
    var body: some View {
            NavigationView{
                ScrollView {
                    VStack {
                        ForEach(data, id: \.self) { item in
                            NavigationLink(destination: ConfirmView()) {
                                Section {
                                    HStack {
                                        Text("\(item)")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("1479 RUB")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    //                                                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.pink.opacity(0.15)]), startPoint: .leading, endPoint: .trailing).frame(width: 320, height: 1, alignment: .center)
                                }
                            }
                            .animation(.easeIn)
                        }
                        
                        
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(15)
                        .padding(5)
                        HStack {
                            Button(action: {
                            }, label: {
                                Text("Confirm order")
                                    .foregroundColor(.black)
                            })
                        }
                        .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color.pink.opacity(0.25))
                        .cornerRadius(10)
                        .padding()
                    }
                    .padding()
                    .overlay(Rectangle()
                                .foregroundColor(.purple).opacity(0.15))
                    .cornerRadius(20)
                    .navigationTitle("My Purchases")
                    .navigationBarItems(
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
                .padding()
            }
    }
}

struct BinView_Previews: PreviewProvider {
    static var previews: some View {
        BinView()
    }
}
