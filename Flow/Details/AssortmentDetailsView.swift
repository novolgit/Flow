//
//  AssortmentDetailsView.swift
//  Flow
//
//  Created by Vlad Novol on 16.01.2021.
//

import SwiftUI



struct AssortmentDetailsView: View {
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
                                    .font(.system(size: 26, weight: .bold, design: .serif))
                                Spacer()
                            }
                            .padding(.leading, 20)
                ){
                    ForEach(self.flowerName(for: flowerID), id: \.id) {flower in
                        HStack{
                            Image(flower.image)
                                .resizable()
                            //                                .frame(width: 70, height: 100)
                            Spacer()
                            HStack{
                                Text(flower.name)
                                Text("\(flower.price)" + "$")
                            }
                        }
                        .padding()
                        .frame(height: 100)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 15, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                            }
                        )
                        .padding()
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
