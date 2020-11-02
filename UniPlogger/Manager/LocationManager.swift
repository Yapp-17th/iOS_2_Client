//
//  LocationManager.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/08.
//  Copyright © 2020 손병근. All rights reserved.
//


import UIKit
import CoreLocation

protocol LocationManagerDelegate: class {
    func didChangeAuthorization(status: CLAuthorizationStatus)
}

class LocationManager: NSObject {
    
    weak var delegate: LocationManagerDelegate?
    static let shared = LocationManager()
    let locationManager = CLLocationManager()
    var location: CLLocation?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    var coordinate: CLLocationCoordinate2D {
        return UserDefaults.standard.location
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    var locationServicesEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    var settingLocationURL: URL? {
        guard let url = URL(string: "App-Prefs:root=Privacy&path=LOCATION") else { return nil }
        return url
    }
    
    var settingAppURL: URL? {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return nil }
        return url
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.startUpdatingLocation()
        //locationManager.requestLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
        delegate?.didChangeAuthorization(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //위치가 업데이트될때마다
        if let location = manager.location {
            self.location = location
            UserDefaults.standard.set(location.coordinate.asDictionary, forDefines: .location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
