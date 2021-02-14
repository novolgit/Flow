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
        
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    currentPage += 1
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                }, label: {
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .font(.system(size: 20, weight: .light, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .padding(7)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 4, yBlack: 4, xWhite: -2, yWhite: -2)
                            }
                        )
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
