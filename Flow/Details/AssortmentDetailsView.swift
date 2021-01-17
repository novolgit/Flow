//
//  AssortmentDetailsView.swift
//  Flow
//
//  Created by Vlad Novol on 16.01.2021.
//

import SwiftUI

struct AssortmentDetailsView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
            ScrollView {
                ForEach(modelData.flowers[0].roses[0].shrubs) { flower in
                    HStack{
                        Text(flower.name)
                        Spacer()
                        Image(flower.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fit)
                    }
                    .padding()
                    .background(
                        Group {
                            NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                        }
                    )
                    .padding()
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
