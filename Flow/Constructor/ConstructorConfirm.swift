//
//  ConstructorConfirm.swift
//  Flow
//
//  Created by Vlad Novol on 2/23/21.
//

import SwiftUI

struct ConstructorConfirm: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var constructorData: ConstructorData
    @EnvironmentObject var modelData: ModelData
    
    @State var constructorName = ""
    @State var showDetail = false
    @State var completeAction = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            Image(uiImage: loadImageFromDiskWith(fileName: "constructorImage1.jpg") ?? UIImage(named: "AppLogo")!)
                .resizable()
                .frame(height: 400)
                .cornerRadius(10)
                .ignoresSafeArea(.all, edges: .top)
            HStack {
                VStack {
                    TextField("Bouquet Name", text: $constructorName)
                        .font(.system(size: 30, weight: .bold, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    Divider()
                }
                Text("144$")
                    .font(.system(size: 26, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    .padding()
                    .background(
                        Group {
                            NeuButtonsView2(radius: 10, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                        }
                    )
            }
            .padding()
            HStack {
                Text("Components")
                    .font(.system(size: 26, weight: .regular, design: .serif))
                    .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                Spacer()
                ChevronCustomButtonStyle(isSet: $showDetail, size: 20)
            }
            .padding([.horizontal, .top])
            VStack {
                ForEach(showDetail ? modelData.flowers[0..<10] : modelData.flowers[0..<3]) { components in
                    HStack {
                        Image(components.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text(components.name)
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                        Spacer()
                        Text(String(components.price) + "$")
                            .font(.system(size: 20, weight: .regular, design: .serif))
                            .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                        Button(action: {
                            deleteComponent()
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                //                        .resizable()
                                //                        .frame(width: 20, height: 20)
                                .foregroundColor(colorScheme == .dark ? Color.reddDark : Color.redd)
                        })
                    }
                }
            }
            .padding()
            .background(
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            )
            .padding()
            HStack{
                Button(action: {
                    completeAction.toggle()
                },
                               label: {
                                HStack {
                                    if !completeAction {
                                        Text("To Cart")
                                            .font(.system(size: 20, weight: .regular, design: .serif))
                                            .foregroundColor( colorScheme == .dark ? Color.offSecondaryGrayDark : Color.offSecondaryGray)
                                    }
                                    CheckmarkCustomButtonStyle(isSet: $completeAction, size: 40)
                                        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                                }
                               })
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.1)
                    .background(
                        Group {
                            CustomConfirmButtonsView3()
                        }
                    )
                Spacer()
                NavigationLink(destination: ConfirmView(totalPrice: 144, coordinate: modelData.stores[0].locationCoordinate, coordinateName: modelData.stores[0].name),
                               label: {
                                HStack {
                                    Text("Continue")
                                        .font(.system(size: 20, weight: .regular, design: .serif))
                                        .foregroundColor( colorScheme == .dark ? Color.greennDark : Color.greenn)
                                    Image(systemName: "arrow.right")
                                        .font(.system(size: 20, weight: .light, design: .serif))
                                        .foregroundColor( colorScheme == .dark ? Color.greennDark : Color.greenn)
                                }
                               })
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.1)
                    .background(
                        Group {
                            CustomConfirmButtonsView3()
                        }
                    )
            }
            .padding()
        }
        .navigationTitle("info")
        .navigationBarTitleDisplayMode(.inline)
        .animation(.spring(response: 0.5, dampingFraction: 1, blendDuration: 1))
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
    
    func deleteComponent() {
        
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
}

struct ConstructorConfirm_Previews: PreviewProvider {
    static var previews: some View {
        ConstructorConfirm()
            .environmentObject(ConstructorData())
            .environmentObject(ModelData())
    }
}
