//
//  TopStoresTabView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct TopStoresTabView: View {
    @EnvironmentObject var modelData: ModelData
    @State var index: Int
    
    var body: some View {
        TabView(selection: self.$index){
            ForEach(modelData.stores) { store in
                VStack{
                    HStack {
                            Text(store.name)
                                .font(.system(size: 24, weight: .medium, design: .serif))
                                .foregroundColor(.gray)
                        Spacer()
                        NavigationLink(
                            destination: StoreDetail(coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city),
                            label: {
                                    Image(systemName: "ellipsis")
                            })
                            .frame(width: 50, height: 50)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                                }
                            )
                    }
                    HStack{
                    Image(store.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(
                            cornerRadius: 10
                        ))
                        Spacer()
//                                .frame(width: UIScreen.main.bounds.width*0.5, height: 150)
                        VStack{
                            Text(store.hours)
                                .font(.system(size: 19, weight: .medium, design: .serif))
                                .foregroundColor(.gray)
                            Text(store.description)
                                .font(.system(size: 16, weight: .medium, design: .serif))
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width*0.92, height: self.index == store.id ? UIScreen.main.bounds.height*0.25 : UIScreen.main.bounds.height*0.22)
            }
            .background(
                Group {
                    NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                }
            )
            .padding()
        }
    }
}

struct TopStoresTabView_Previews: PreviewProvider {
    static var previews: some View {
        TopStoresTabView(index: 1)
    }
}
