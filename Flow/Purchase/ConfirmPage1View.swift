//
//  ConfirmPage1View.swift
//  Flow
//
//  Created by Vlad Novol on 22.01.2021.
//

import SwiftUI
import MapKit

struct ConfirmPage1View: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var region = MKCoordinateRegion()
    
    @Binding var currentPage: Int
    
    var totalPrice: Double
    var coordinate: CLLocationCoordinate2D
    var coordinateName: String
    
    var body: some View {
        let markers = [
            Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)), name: coordinateName)
        ]
        
        ScrollView(showsIndicators: false) {
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        currentPage += 1
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                    }, label: {
                        ZStack {
                            Image(systemName: "chevron.right.circle.fill")
                                .resizable()
                                .frame(width: 38, height: 36)
                                .foregroundColor(colorScheme == .light ? .offSecondaryGrayDark : .offSecondaryGray)
                                .shadow(color: colorScheme == .dark ? .bottomShadowDark : .bottomShadow, radius: 3, x: 3, y: 3)
                                .shadow(color: colorScheme == .dark ? .topShadowDark : .topShadow, radius: 3, x: -1.5, y: -1.5)
                            Image(systemName: "chevron.right")
                                .resizable()
                                .font(.system(size: 10, weight: .light, design: .serif))
                                .frame(width: 11, height: 19)
                                .foregroundColor(colorScheme == .dark ? Color.offSecondaryGrayDark.opacity(0.5) : Color.offSecondaryGray.opacity(0.5))
                                .offset(x: 1)
                        }
                    })
                }
                .padding()
                Map(
                    coordinateRegion: $region,
                    annotationItems: markers) { marker in
                    MapMarker(
                        coordinate: coordinate,
                        tint: .pink
                    )}
                    .onAppear {
                        setRegion(coordinate)
                    }
                    .frame(width: UIScreen.main.bounds.width*0.90, height: UIScreen.main.bounds.height*0.315)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: UIScreen.main.bounds.width*0.93, height: UIScreen.main.bounds.height*0.33)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 25, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                        }
                    )
                    .padding()
                Button(action: {
                    currentPage += 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }, label: {
                    Text("Next")
                        .font(.system(size: 26, weight: .regular, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                })
                .font(.system(size: 20, weight: .medium, design: .serif))
                .frame(width: 350, height: 100)
                .contentShape(RoundedRectangle(cornerRadius: 15.0))
                .background(
                    Group {
                        CustomTappedAccountButton3()
                    }.padding()
                )
                Spacer()
            }
        }
        .navigationBarTitle("Order Info", displayMode: .inline)
        .navigationBarItems(trailing: Text(String(totalPrice))
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray))
    }
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
}
