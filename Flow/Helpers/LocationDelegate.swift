//
//  LocationDelegate.swift
//  Flow
//
//  Created by Vlad Novol on 2/17/21.
//
import SwiftUI
import MapKit

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
