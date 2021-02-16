//
//  FeaturedView.swift
//  Flow
//
//  Created by Vlad Novol on 30.12.2020.
//

import SwiftUI
import MapKit
import FirebaseStorage
import Combine
import Firebase

struct FeaturedView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("log_Status") var userStatus = false
    @AppStorage("current_image") var userImage = ""
    
    @EnvironmentObject var modelData: ModelData
    
    @State var featuredIndex = 1
    @State var topStoresIndex = 1
    
    @State var CImage = UserDefaults.standard.value(forKey: "CImage") as? UIImage ?? nil
    //    @State var account: AccountFirebase?
    
    var chart: Chart
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false) {
                //                NavigationLink(
                //                    destination: Test(),
                //                    label: {
                //                        Text("Navigate")
                //                    })
                VStack {
                    VStack{}.frame(height: 30)
                    HStack {
//                        Button(action: {
//                            takeScreenshot()
//                        }, label: {
//                            Text("Button")
//                        })
                        Text("Featured")
                            .font(.system(size: 28, weight: .black, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                        Spacer()
                        Image(systemName: "hand.draw")
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                            .font(.system(size: 20, weight: .light, design: .serif))
                            .rotation3DEffect(
                                .degrees(180),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .padding(.horizontal)
                    FeaturedTabView(index: featuredIndex)
                        //                        .animation(.easeOut)
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
                        .animation(.easeOut)
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
                                                //                                            .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))
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
                                                
                                                //                                            .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))
                                                .frame(width: 34, height: 34)
                                                .background(
                                                    Group {
                                                        NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 1, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                                    }
                                                )
                                        }
                                    })
            )
            .navigationBarTitle("Featured", displayMode: .inline)
            .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
        }
        
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
    }
}

struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    
    private let placeholder: Placeholder
    
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    private var cancellable: AnyCancellable?
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
