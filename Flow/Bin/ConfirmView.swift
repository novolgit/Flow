//
//  ConfirmView.swift
//  Flow
//
//  Created by Vlad Novol on 31.12.2020.
//
import MapKit
import SwiftUI

struct ConfirmView: View {
    @State private var podezd: String = ""
    @State private var floar: String = ""
    @State private var domofon: String = ""
    @State private var kv: String = ""
    @State private var phone: String = "+7"
    
    var body: some View {
        ScrollView{
            ConfirmMapView(coordinate: CLLocationCoordinate2D(
                latitude: 34.011_286,
                longitude: -116.166_868))
                .ignoresSafeArea(edges: .top)
                    .frame(height: 400)
                .offset(y: -50)
                .cornerRadius(40)
            Text("Lenina 17, kv 25")
                .offset(y: -70)
        VStack{
            HStack{
                Text("Delivery")
                Spacer()
                Text("samovUUvoz")
            }
            HStack{
                VStack{
                    Text("podezd")
                    TextField("Enter your podezd", text: $podezd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack{
                    Text("floar")
                    TextField("Enter your floar", text: $floar)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack{
                    Text("podezd")
                    TextField("Enter your domofon", text: $domofon)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack{
                    Text("podezd")
                    TextField("Enter your kv", text: $kv)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            VStack{
                Text("Phone")
                TextField("Enter your phone number", text: $phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding()
        .navigationBarTitle("Order", displayMode: .automatic)
    }
    }
}

struct ConfirmView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmView()
    }
}

struct ConfirmMapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
}

struct ConfirmMapView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmMapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
