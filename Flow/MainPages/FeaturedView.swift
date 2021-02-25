//
//  FeaturedView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI

struct FeaturedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    
    @State var userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var featuredIndex = 1
    @State var topStoresIndex = 1
    
    var chart: Chart
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack{}.frame(height: 30)
                    HStack {
                        Text("Featured")
                            .font(.system(size: 28, weight: .black, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        Spacer()
                        HStack {
                            Image(systemName: "hand.draw")
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .rotation3DEffect(
                                    .degrees(180),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                            Image(systemName: "hand.tap")
                                .font(.system(size: 20, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        }
                    }
                    .padding(.horizontal)
                    MockTabView(index: featuredIndex)
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    HStack {
                        Text("Charts")
                            .font(.system(size: 28, weight: .black, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Spacer()
                        Image(systemName: "hand.tap")
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                    .padding(.horizontal)
                    ChartView(chart: modelData.charts[0])
                    HStack {
                        Text("Nearly Stores")
                            .font(.system(size: 28, weight: .black, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Spacer()
                        Image(systemName: "scroll")
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                    .padding(.horizontal)
                    NearlyStores()
                        .padding()
                        .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
                    HStack {
                        Text("Top Stores")
                            .font(.system(size: 28, weight: .black, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        Spacer()
                        Image(systemName: "tablecells")
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                    }
                    .padding(.horizontal)
                    TopStoresTabView(index: topStoresIndex)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.28)
                        .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
                }
                VStack{}.frame(height: 30)
            }
            .navigationBarItems(trailing: NavigationLink(
                                    destination: AccountView(),
                                    label: {
                                        if !userStatus {
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width:30,height:30)
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                                .frame(width: 34, height: 34)
                                                .background(
                                                    Group {
                                                        NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                                    }
                                                )
                                        }
                                        else {
                                            Image(uiImage: loadImageFromDiskWith(fileName: "profileImage.jpg") ?? UIImage(named: "120x120_clear")!)
                                                .resizable()
                                                .clipShape(Circle())
                                                .font(.system(size: 18, weight: .light, design: .serif))
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                                .frame(width: 34, height: 34)
                                                .background(
                                                    Group {
                                                        NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                                    }
                                                )
                                        }
                                    })
            )
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                    let userStatus = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    
                    self.userStatus = userStatus
                    
                }
            }
            .navigationBarTitle("Featured", displayMode: .inline)
            .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
        }
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

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView(chart: ModelData().charts[0]).preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}
