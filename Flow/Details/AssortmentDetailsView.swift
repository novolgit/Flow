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
    
    var sectionedData: [[Flower]] {
        let sections = Set<String>(modelData.flowers.map { $0.flower })
        var sectionedArray = [[Flower]]()
        for section in sections {
            let flowers = modelData.flowers.filter { $0.flower == section }
            sectionedArray.append(flowers)
        }
        return sectionedArray
    }
    
    private var flowerIndices: [String] {
        Array<String>(Set<String>( modelData.flowers.reduce(into: [String](), { (section, flower) in
            section.append(flower.flower)
        }) )).sorted()
    }
    
    private func flowerName(for section: String) -> [Flower] {
        modelData.flowers.filter { $0.flower.contains(section) }
    }
    
    var body: some View {
        
        ScrollView {
            ForEach(flowerIndices, id: \.self) { flowerID in
                Section(header:
                            HStack {
                                Text(flowerID)
                                    .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                                    .font(.system(size: 28, weight: .black, design: .serif))
                                Spacer()
                                Image(systemName: "hand.tap")
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
                                .frame(width: UIScreen.main.nativeBounds.width * 0.1, height: UIScreen.main.nativeBounds.height * 0.05)
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
        }
        .navigationBarTitle("Assortment")
        .toolbar(content: {
            Button(action: {
                
            }, label: {
                Text("Sort")
            })
        })
    }
}

struct AssortmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AssortmentDetailsView()
            .environmentObject(ModelData())
    }
}
