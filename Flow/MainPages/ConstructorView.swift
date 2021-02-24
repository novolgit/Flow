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
    @EnvironmentObject var constructorData: ConstructorData
    
    @State private var showChoose = false
    @State private var show: Bool = false
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    @State var modelsArray: Array<Any> = []
    @State var isDelete: Int = 0
    @State var snapArray: Array<Any> = []
    @State var snapSet: Bool = false
    @State var showSheet: Bool = false
    
    @Namespace private var namespace
    
    let imageSize: CGSize = CGSize(width: 1000, height: 1000)
    
    var body: some View {
        NavigationView{
        VStack{
            ZStack{
                SceneKitViewVar
                VStack {
                    HStack {
                        Button(action: {
                            modelsArray.removeLast()
                            isDelete += 1
                        }, label: {
                            Image(systemName: "trash")
                                .font(.system(size: 30, weight: .ultraLight, design: .serif))
                                .foregroundColor(Color.offSecondaryGray)
                        })
                        Spacer()
                        //                        Button(action: {
                        //                        }, label: {
                        //                            Image(systemName: "arrowshape.turn.up.left")
                        //                                .font(.system(size: 22, weight: .ultraLight, design: .serif))
                        //                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        //                        })
                        //                        Button(action: {
                        //                        }, label: {
                        //                            Image(systemName: "square.and.arrow.up")
                        //                                .font(.system(size: 22, weight: .ultraLight, design: .serif))
                        //                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        //                        })
                        NavigationLink(destination: ConstructorConfirm(),
                                       label: {
                                        Image(systemName: "cart.badge.plus")
                                            .font(.system(size: 30, weight: .ultraLight, design: .serif))
                                            .foregroundColor(Color.offSecondaryGray)
                                       })
                            .simultaneousGesture(TapGesture()
                                                    .onEnded{
                                                        snapSet = true
                                                    })
                    }
                    .padding()
                    Spacer()
                }
            }
            VStack{
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
        .navigationTitle("")
        .navigationBarHidden(true)
        }
    }
    
    var SceneKitViewVar: some View {
        SceneKitView(modelsArray: $modelsArray, isDelete: $isDelete, snapArray: $snapArray, snapSet: $snapSet)
            .ignoresSafeArea()
    }
    //    func takeScreenshot(shouldSave: Bool = true) -> UIImage? {
    //        print("takeScreenshot")
    //        var screenshotImage :UIImage?
    //        let layer = UIApplication.shared.keyWindow!.layer
    //        let scale = UIScreen.main.scale
    //        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
    //        guard let context = UIGraphicsGetCurrentContext() else {return nil}
    //        layer.render(in:context)
    //        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
    //        UIGraphicsEndImageContext()
    //        UserDefaults.standard.set(screenshotImage, forKey: "CImage")
    //        print(screenshotImage)
    //        return screenshotImage
    //    }
}

struct ConstructorView_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorView()
            .environmentObject(ConstructorData())
            .environmentObject(ModelData())
    }
}
