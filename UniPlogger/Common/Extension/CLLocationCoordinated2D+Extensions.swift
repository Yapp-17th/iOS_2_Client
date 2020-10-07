//
//  CLLocationCoordinated2D+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/08.
//  Copyright © 2020 손병근. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D {
    
    private static let Lat = "lat"
    private static let Lon = "lon"
    
    typealias CLLocationDictionary = [String: CLLocationDegrees]
    
    var asDictionary: CLLocationDictionary {
        return [CLLocationCoordinate2D.Lat: self.latitude,
                CLLocationCoordinate2D.Lon: self.longitude]
    }
    
    init(dict: CLLocationDictionary) {
        self.init(latitude: dict[CLLocationCoordinate2D.Lat]!,
                  longitude: dict[CLLocationCoordinate2D.Lon]!)
    }
    
}
