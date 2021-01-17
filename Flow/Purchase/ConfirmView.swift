//
//  ConfirmView.swift
//  Flow
//
//  Created by Vlad Novol on 31.12.2020.
//
import MapKit
import SwiftUI

struct ConfirmView: View {
    @State private var entrance: String = ""
    @State private var floor: String = ""
    @State private var kv: String = ""
    @State private var phone: String = "+7"
    @State private var addres: String = ""
    @State private var comments: String = ""
    @State private var isTap: Bool = true
    
    var totalPrice: Double
    
    var coordinate: CLLocationCoordinate2D
    var coordinateName: String
    
    @State private var region = MKCoordinateRegion()
    
    @State private var pickupTime = Date()
    
    @State private var deliveryData: [String] = ["Addres",
                                                "Street",
                                                "House",
                                                "Entrance",
                                                "Floor",
                                                "Phone",
                                                "Comment",
    ]
            
    var range: ClosedRange<Date>{
        let now = Date().addingTimeInterval(1800)
        let tomorrow = Date().addingTimeInterval(86400)
        
        return now...tomorrow
    }
    
    var body: some View {
        
        let markers = [
            Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)), name: coordinateName)
        ]
        VStack{
            ScrollView(showsIndicators: false){
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
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .frame(width: UIScreen.main.bounds.width*0.93, height: UIScreen.main.bounds.height*0.33)
                    .background(
                        Group {
                            NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
                        }
                    )
                    .padding()
                VStack{
                    HStack{
                        Button(action: {
                            isTap = true
                        }) {
                            HStack {
                                Image(systemName: "figure.stand.line.dotted.figure.stand")
                                    .font(.title)
                                Text("Delivery")
                                    .font(.system(size: 16, weight: .medium, design: .serif))
                                    
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width*0.48, height: 110)
                            .foregroundColor(.gray)
                            .contentShape(RoundedRectangle(cornerRadius: 15.0))
                            .background(
                                Group {
                                    if !isTap{
                                        Group {
                                            CustomTappedAccountButton3()
                                        }
                                    } else{
                                        Group {
                                            CustomConfirmButtonsView3()
                                        }
                                    }
                                }.padding()
                            )
                        }
//                        .padding(.horizontal, 10)
                        Spacer()
                        Button(action: {
                            isTap = false
                        }) {
                            HStack {
                                Image(systemName: "figure.walk")
                                    .font(.title)
                                Text("pickup")
                                    .font(.system(size: 16, weight: .medium, design: .serif))
                                    
                            }
                            .frame(width: UIScreen.main.bounds.width*0.48, height: 110)
                            .foregroundColor(.gray)
                            .contentShape(RoundedRectangle(cornerRadius: 15.0))
                            .background(
                                Group {
                                    if isTap{
                                        Group {
                                            CustomTappedAccountButton3()
                                        }
                                    } else{
                                        Group {
                                            CustomConfirmButtonsView3()
                                        }
                                    }
                                }.padding()
                            )
                        }
//                        .padding(.horizontal, 10)
                    }
//                    .padding(.vertical, 20)
                    if isTap{
                        ForEach(deliveryData, id: \.self) { d in
                        VStack(alignment: .leading){
                            Text(d)
                                .font(.system(size: 20, design: .serif))
                                
                            TextField("Enter your \(d)", text: $addres)
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(.gray)
                            Divider()
                        }
                        .padding()
                        .frame(height: UIScreen.main.bounds.height*0.12)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                            }
                        )
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                    }
                    } else{
                        VStack{
                            VStack(alignment: .leading){
                                Text("Addres")
                                    .font(.system(size: 20, design: .serif))
                                    
                                TextField("Enter your Addres", text: $addres)
                                    .font(.system(size: 20, design: .serif))
                                Divider()
                            }
                            .padding()
                            .frame(height: UIScreen.main.bounds.height*0.135)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                            )
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            VStack(alignment: .leading){
                                Text("Comments")
                                    .font(.system(size: 20, design: .serif))
                                    
                                TextField("Enter your Comments", text: $comments)
                                    .font(.system(size: 20, design: .serif))
                                Divider()
                            }
                            .padding()
                            .frame(height: UIScreen.main.bounds.height*0.12)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                            )
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            HStack{
                            HStack{
//                                Text("Time")
//                                    .font(.system(size: 20, design: .serif))
//
                                DatePicker(
                                    "Time",
                                    selection: $pickupTime,
                                    in: range,
                                    displayedComponents: .hourAndMinute
                                )
                                .font(.system(size: 10, design: .serif))
                                .foregroundColor(.gray)
                                
                                //                                .datePickerStyle(GraphicalDatePickerStyle())
                            }
                            .padding()
                            .frame(height: UIScreen.main.bounds.height*0.12)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                            )
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            HStack{
                                Menu("Payment") {
                                    Button("Apple Pay", action: {
                                    })
                                    Button("Card", action: {
                                    })
                                    Button("Cash", action: {})
                                }
                                .foregroundColor(.gray)
                                .font(.system(size: 20, design: .serif))
                            }
                            .padding()
                            .frame(height: UIScreen.main.bounds.height*0.12)
                            .background(
                                Group {
                                    NeuButtonsView2(radius: 20, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                                }
                            )
                            .padding(.horizontal,16)
                            .padding(.vertical,8)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width*0.90)
                    }
                    Button(action: {}, label: {
                        Text("Pay")
                            .foregroundColor(.gray)
                            .font(.system(size: 24, weight: .medium, design: .serif))
                            
                    })
                    .frame(width: UIScreen.main.bounds.width*0.6,                 height: UIScreen.main.bounds.height*0.1)
                    .background(
                        Group {
                            CustomConfirmButtonsView()
                        }
                    )
                    .padding(.horizontal,16)
                    .padding(.vertical,8)
                    VStack{}.frame(height: 20)
                }
            }
        }
            .navigationBarTitle("Order", displayMode: .inline)
            .background(LinearGradient(Color.offGrayLinearStart, Color.offGrayLinearEnd))
//            .padding(.horizontal, 20)
            .navigationBarItems(trailing: Text(String(totalPrice))
                                    .font(.system(size: 20, design: .serif))
                                .foregroundColor(Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))))
        }
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
    }

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView(totalPrice: 0.0, coordinate: CLLocationCoordinate2D(), coordinateName: "")
    }
}
