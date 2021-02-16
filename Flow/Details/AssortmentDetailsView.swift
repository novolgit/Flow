//
//  AssortmentDetailsView.swift
//  Flow
//
//  Created by Vlad Novol on 16.01.2021.
//

import SwiftUI



struct AssortmentDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var modelData: ModelData
    //    @State private var sort: Set<String> = modelData.flowers
    @State private var showFavoritesOnly = false
    @State var flowerID = Flower.ID()
    @State var press = false
    
    var filteredFavoriteFlowers: [Flower] {
        modelData.flowers.filter { flower in
            (!showFavoritesOnly || flower.isSelected)
        }
    }
    
    var sectionedData: [[Flower]] {
        let sections = Set<String>(filteredFavoriteFlowers.map { $0.flower })
        var sectionedArray = [[Flower]]()
        for section in sections {
            let flowers = filteredFavoriteFlowers.filter { $0.flower == section }
            sectionedArray.append(flowers)
        }
        return sectionedArray
    }
    
    private var flowerIndices: [String] {
        Array<String>(Set<String>( filteredFavoriteFlowers.reduce(into: [String](), { (section, flower) in
            section.append(flower.flower)
        }) )).sorted()
    }
    
    private func flowerName(for section: String) -> [Flower] {
        filteredFavoriteFlowers.filter { $0.flower.contains(section) }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack{}.frame(height: 20)
                HStack{
                    Spacer()
                    Toggle(isOn: $showFavoritesOnly) {
                    }
                    .toggleStyle(PressToggleStyle(imageSize: 20, offsetValue: 16, toggleWidth: 80, toggleHeight: 40, borderWidth: 70, borderHeight: 30, image: "heart", imageFill: "heart.fill", lightColor: Color.redd, darkColor: Color.reddDark, lineWidth: 1))
                    .animation(.spring(response: 0.8, dampingFraction: 0.8, blendDuration: 0))
                }
                .padding()
                ForEach(flowerIndices, id: \.self) { flowerID in
                    Section(header:
                                HStack {
                                    Text(flowerID)
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 28, weight: .black, design: .serif))
                                    Spacer()
                                    Image(systemName: "hand.tap")
                                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                        .font(.system(size: 20, weight: .light, design: .serif))
                                    
                                }
                                .padding(.horizontal, 20)
                    ){
                        ForEach(self.flowerName(for: flowerID), id: \.id) {flower in
                            NavigationLink(
                                destination: FlowerDetail(flowerDetail: flower),
                                label: {
                                    
                                    HStack{
                                        Image(flower.image)
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width * 0.225, height: UIScreen.main.bounds.height * 0.15)
                                            .clipShape(Circle())
                                        //                                .frame(width: 70, height: 100)
                                        Spacer()
                                        HStack{
                                            Text(flower.name)
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                                .font(.system(size: 18, weight: .regular, design: .serif))
                                            Spacer()
                                            Text("\(flower.price)" + "$")
                                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                                .font(.system(size: 18, weight: .regular, design: .serif))
                                            ZStack{
                                                if flower.isSelected {
                                                    Image(systemName: "heart.fill")
                                                        .resizable()
                                                        .frame(width: 30, height: 28)
                                                        .foregroundColor(colorScheme == .light ? .reddDark : .redd)
//                                                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
//                                                        .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                                                    Image(systemName: "heart")
                                                        .resizable()
                                                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                                                        .frame(width: 30, height: 28)
                                                        .foregroundColor(colorScheme == .dark ? Color.reddDark.opacity(0.1) : Color.redd.opacity(0.1))
                                                } else {
                                                    Image(systemName: "heart")
                                                        .resizable()
                                                        .frame(width: 30, height: 28)
                                                        .foregroundColor(colorScheme == .light ? .reddDark : .redd)
//                                                        .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
//                                                        .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                                                    Image(systemName: "heart")
                                                        .resizable()
                                                        .font(.system(size: 10, weight: .ultraLight, design: .serif))
                                                        .frame(width: 30, height: 28)
                                                        .foregroundColor(colorScheme == .dark ? Color.reddDark.opacity(0.1) : Color.redd.opacity(0.1))
                                                }
                                            }
                                        }
                                        .padding(8)
                                    }
                                    .padding()
                                    .frame(height: 100)
                                    .background(
                                        Group {
                                            NeuButtonsView2(radius: 15, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                        }
                                    )
                                    .padding()
                                })
                        }
                    }
                }
                .frame(width: geometry.size.width)
            }
        }
        .navigationBarTitle("Assortment")
        .background(LinearGradient(colorScheme == .dark ? Color.offGrayLinearStartDark : Color.offGrayLinearStart, colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
    }
}

struct AssortmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AssortmentDetailsView()
            .environmentObject(ModelData())
    }
}
