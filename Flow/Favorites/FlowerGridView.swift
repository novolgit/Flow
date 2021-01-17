//
//  FlowerGridView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

struct FlowerGridView: View {
    @EnvironmentObject var modelData: ModelData
    
    var store : Store
    @Binding var columns : [GridItem]
    
    
    @Namespace private var namespace
    @State private var isZoomed = false

    var frame: CGFloat {
        columns.count == 2  ? 160 : 190
    }
    
    
    @State var rating = 3

    var body: some View {
        VStack{
            if self.columns.count == 2{
                VStack(spacing: 15){
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image(store.image)
                            .resizable()
                            .cornerRadius(15)
                            .padding()
                            .frame(width: frame, height: frame)
                            .matchedGeometryEffect(id: "image", in: self.namespace)
                        Button {
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color.pink.opacity(0.4))
                                .padding()
                        }
                        .matchedGeometryEffect(id: "heat", in: self.namespace)
                        .padding()
                    }
                    Text(store.name)
                        .lineLimit(1)
                        .font(.system(size: 16, weight: .bold, design: .serif))
                        .foregroundColor(.gray)
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                    NavigationLink(
                        destination: StoreDetail(coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city),
                        label: {
                            HStack {
                                Text("Store Details")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .bold, design: .serif))
                                Image(systemName: "ellipsis")
                            }
                        })
                        .matchedGeometryEffect(id: "detail", in: self.namespace)
                    NavigationLink(
                        destination: AssortmentDetailsView(),
                        label: {
                            HStack {
                                Text("Assortment")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .bold, design: .serif))
                                Image(systemName: "eye")
                            }
                        })
                        .padding(.bottom, 16)
                        .matchedGeometryEffect(id: "assort", in: self.namespace)
                }
//                .frame(width: 180)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                    }
                )
                .padding()
            }
            else{
                HStack{
                        Image(store.image)
                            .resizable()
//                            .frame(width: 170, height: 170)
                            .cornerRadius(15)
                            .padding()
                            .frame(width: frame, height: frame)
                            .matchedGeometryEffect(id: "image", in: self.namespace)
                    VStack{
                        HStack {
                            Text(store.name)
                                .foregroundColor(.gray)
                                .font(.system(size: 16, weight: .bold, design: .serif))
                                .matchedGeometryEffect(id: "title", in: self.namespace)
                            Spacer()
                            Button {
                            } label: {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(Color.pink.opacity(0.4))
                            }
                            .matchedGeometryEffect(id: "heat", in: self.namespace)
                        }
                        .padding()
                        RatingView(rating: $rating)
                            .padding(6)
                        NavigationLink(
                            destination: StoreDetail(coordinate: store.locationCoordinate, coordinateName: store.name, coordinateDescription: store.description, coordinatePhone: store.phone, coordinateImage: store.image, coordinateHours: store.hours, coordinateCity: store.city),
                            label: {
                                HStack {
                                    Text("Store Details")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .bold, design: .serif))
                                    Image(systemName: "ellipsis")
                                }
                            })
                            .matchedGeometryEffect(id: "buy", in: self.namespace)
                            .padding(6)
                        NavigationLink(
                            destination: AssortmentDetailsView(),
                            label: {
                                HStack {
                                    Text("Assortment")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .bold, design: .serif))
                                    Image(systemName: "eye")
                                }
                            })
                            .matchedGeometryEffect(id: "assort", in: self.namespace)
                    }
                    .padding()
                }
                .frame(width: UIScreen.main.bounds.width*0.92)
                .background(
                    Group {
                        NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                    }
                )
//                .padding()
            }
        }
    }
}
