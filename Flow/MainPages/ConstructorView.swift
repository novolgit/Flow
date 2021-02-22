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
    
    @Namespace private var namespace
    
    let imageSize: CGSize = CGSize(width: 1000, height: 1000)
    
    var body: some View {
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
                                .font(.system(size: 22, weight: .ultraLight, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        })
                        Spacer()
                        Button(action: {
                        }, label: {
                            Image(systemName: "arrowshape.turn.up.left")
                                .font(.system(size: 22, weight: .ultraLight, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        })
                        Button(action: {
                        }, label: {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 22, weight: .ultraLight, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        })
                        Button(action: {
                            
                            let highresImage = SceneKitViewVar.asImage(size: imageSize)
                            guard let highresData = highresImage.jpegData(compressionQuality: 1) else { return }
                            constructorData.constructorImage.append(highresData)
                            
                            func saveImage(imageName: String, image: UIImage) {
                                guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
                                
                                let fileName = imageName
                                let fileURL = documentsDirectory.appendingPathComponent(fileName)
                                guard let data = image.jpegData(compressionQuality: 1) else { return }
                                
                                //                                if FileManager.default.fileExists(atPath: fileURL.path) {
                                //                                    do {
                                //                                        try FileManager.default.removeItem(atPath: fileURL.path)
                                //                                        print("Removed old image")
                                //                                    } catch let removeError {
                                //                                        print("couldn't remove file at path", removeError)
                                //                                    }
                                //                                }
                                do {
                                    try data.write(to: fileURL)
                                } catch let error {
                                    print("error saving file with error", error)
                                }
                                print("data \(data)")
                                print("document \(documentsDirectory)")
                            }
                            
                            //                            func saveImageIndex(data: Data) {
                            for index in constructorData.constructorImage.indices {
                                saveImage(imageName: "constructorImage\(index).jpg", image: UIImage(data: constructorData.constructorImage[index]) ?? UIImage(named: "120x120_clear")!)
                            }
                            //                            }
                            
                            
                            
                            print("image counts: \(constructorData.constructorImage)")
                            
                        }, label: {
                            Image(systemName: "cart.badge.plus")
                                .font(.system(size: 22, weight: .ultraLight, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        })
                    }
                    .padding()
                    Spacer()
                }
            }
            bottomNav
        }
    }
    
    var SceneKitViewVar: some View {
        SceneKitView(modelsArray: $modelsArray, isDelete: $isDelete)
            .ignoresSafeArea()
    }
    var bottomNav: some View {
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
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
            
        }
        
        return nil
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
