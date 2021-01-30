//
//  StoreDetail.swift
//  Flow
//
//  Created by Vlad Novol on 11.01.2021.
//

import SwiftUI
import MapKit


struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
    var name: String
}

struct StoreDetail: View {
    @EnvironmentObject var modelData: ModelData
    var coordinate: CLLocationCoordinate2D
    var coordinateName: String
    var coordinateDescription: String
    var coordinatePhone: String
    var coordinateImage: String
    var coordinateHours: String
    var coordinateCity: String
    @State private var region = MKCoordinateRegion()
    @State var isTap = false
    @State var tracking: MapUserTrackingMode = .follow
    @State private var bottomSheetShown = false
    var manager = CLLocationManager()
    var managerDelegate = locationDelegate()
    @State var isFavorite = false
    
    
    
    var body: some View {
        
        let markers = [
            Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)), name: coordinateName)
        ]
        
        GeometryReader { geometry in
            Map(
                coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $tracking,
                annotationItems: markers) { marker in
                MapMarker(
                    coordinate: coordinate,
                    tint: .pink
                )
            }
            .onTapGesture {
                isTap = !isTap
            }
//            CustomSheetView2(coordinateImage: coordinateImage, coordinateName: coordinateName, coordinateDescription: coordinateDescription, coordinatePhone: coordinatePhone, coordinateHours: coordinateHours, coordinateCity: coordinateCity)
            CustomSheetView(isOpen: $isTap, maxHeight: 620, minHeight: 163, coordinateImage: coordinateImage, coordinateName: coordinateName, coordinateDescription: coordinateDescription, coordinatePhone: coordinatePhone, coordinateHours: coordinateHours, coordinateCity: coordinateCity)
            .edgesIgnoringSafeArea(.all)
            
        }
        .background(BlurView())
        .onAppear {
            setRegion(coordinate)
            manager.delegate = managerDelegate
            managerDelegate.locationManagerDidChangeAuthorization(manager)
        }
        .frame(height: UIScreen.main.bounds.height)
        .ignoresSafeArea(edges: .top)
//        .navigationTitle(coordinateName, displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.isFavorite.toggle()
        }, label: {
            Image(systemName: isFavorite ? "star.fill" : "star")
                .foregroundColor(.yellow)
        }))
    }
    func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        )
    }
}

struct StoreDetail_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetail(coordinate: CLLocationCoordinate2D(), coordinateName: "", coordinateDescription: "", coordinatePhone: "", coordinateImage: "", coordinateHours: "", coordinateCity: "")
            .environmentObject(ModelData())
    }
}

class locationDelegate : NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var currentLatitude: String = "none"
    var currentLongitude: String = "none"
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if manager.authorizationStatus == .authorizedWhenInUse {
            print("authorized")
            
            manager.startUpdatingLocation()
            
            if manager.accuracyAuthorization != .fullAccuracy {
                print("reduce accuracy")
                
                manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "Location") {
                    (err) in
                    if err != nil {
                        print(err!)
                        return
                    }
                }
            }
        } else {
            print("not authorized")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(String(format: "%+.06f", location.coordinate.latitude))
            print(String(format: "%+.06f", location.coordinate.longitude))
            
            currentLatitude = String(format: "%+.06f", location.coordinate.latitude)
            currentLongitude = String(format: "%+.06f", location.coordinate.longitude)
            
        }
    }
}
