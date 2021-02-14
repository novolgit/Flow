//
//  ConstructorView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import UIKit
import SceneKit

struct ConstructorView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showChoose = false
    @State private var show: Bool = false
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State var modelsArray: Array<Any> = []
    @State var isDelete: Int = 0
    
    @Namespace private var namespace 
    
    let imageSize: CGSize = CGSize(width: 1000, height: 1000)
    
    var body: some View {
        //        GeometryReader { geometry in
        VStack{
            ZStack{
                SceneKitView(modelsArray: $modelsArray, isDelete: $isDelete)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Button(action: {
                            modelsArray.removeLast()
                            isDelete += 1
                        }, label: {
                            Image(systemName: "trash")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.left")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                        Button(action: {
                            //                            _ = SceneKitView().asImage(size: imageSize)
                        }, label: {
                            Image(systemName: "cart.badge.plus")
                            //                                .resizable()
                            //                                .frame(width: 30, height: 30)
                        })
                    }
                    .padding()
                    Spacer()
                }
            }
            VStack{
                if !show {Button(action: {
                    //                    withAnimation(.spring()) {
                    show.toggle()
                    
                    //                    }
                }, label: {
                    Image(systemName: "chevron.compact.up")
                        .resizable()
                        .frame(width: 30, height: 10)
                        .padding(8)
                        .matchedGeometryEffect(id: "ConstructorCapsule", in: self.namespace)
                })
                } else {
                    VStack{
                        Capsule()
                            .frame(width: 50, height: 5)
                            .foregroundColor(.gray)
                            .padding()
                            .matchedGeometryEffect(id: "ConstructorCapsule", in: self.namespace)
                            .onTapGesture {
                                //                                withAnimation(.spring()) {
                                show.toggle()
                                
                                //                                }
                            }
                        HStack{
                            HStack {
                                Image(systemName: "magnifyingglass")
                                
                                TextField("search", text: $searchText, onEditingChanged: { isEditing in
                                    self.showCancelButton = true
                                }, onCommit: {
                                    print("onCommit")
                                }).foregroundColor(.primary)
                                
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                                }
                            }
                            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                            .foregroundColor(.secondary)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10.0)
                            
                            if showCancelButton  {
                                Button("Cancel") {
                                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                    self.searchText = ""
                                    self.showCancelButton = false
                                }
                                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                                .foregroundColor(Color(.systemBlue))
                            }
                        }
                        .padding(.horizontal)
                        .navigationBarHidden(showCancelButton)
                        //                .animation(.spring())
                    }
                }
                if !show {ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0) {
                        ForEach(modelData.models) {model in
                            VStack {
                                Text(model.name)
                                HStack{
                                    Image(model.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                    Button(action: {
                                        modelsArray.append(model.image + ".usdz")
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                    }, label: {
                                        Image(systemName: "plus.app")
                                    })
                                }
                            }
                            .frame(width: 80, height: 80)
                            .padding()
                        }
                    }
                }
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(modelData.models) {model in
                            HStack {
                                Image(model.image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Spacer()
                                VStack{
                                    Text("Name")
                                    Text(model.name)
                                }
                                Button(action: {
                                    modelsArray.append(model.image + ".usdz")
                                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                }, label: {
                                    Image(systemName: "plus.app")
                                })
                            }
                            .padding()
                        }
                    }
                    .frame(height: 500)
                }
            }
            .background(
                Group {
                    NeuButtonsView2(radius: 25, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .padding()
        }
    }
}

struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
            .environmentObject(ModelData())
    }
}
