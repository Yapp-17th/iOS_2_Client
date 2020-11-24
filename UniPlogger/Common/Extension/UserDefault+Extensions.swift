//
//  UserDefault+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/08.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import CoreLocation

enum UPUserDefaulKey: String {
    case appID = "kr.co.yapp17.iOS2.UniPlogger"
    case location = "UPUSERDEFAULT_KEY_LOCATION"
    case userToken = "USERDEFAULT_KEY_USERTOKEN"
}

// MARK: - MPUserDefaultProtocol
protocol MPUserDefaultProtocol {
    // MARK: Set
    func set(_ value: Int, forDefines: UPUserDefaulKey)
    func set(_ value: Float, forDefines: UPUserDefaulKey)
    func set(_ value: Bool, forDefines: UPUserDefaulKey)
    func set(_ value: Any?, forDefines: UPUserDefaulKey)
    func set(_ value: Date, forDefines: UPUserDefaulKey)
    
    // MARK: Get
    func integer(forDefines: UPUserDefaulKey) -> Int
    func float(forDefines: UPUserDefaulKey) -> Float
    func bool(forDefines: UPUserDefaulKey) -> Bool
    func string(forDefines: UPUserDefaulKey) -> String?
    func date(forDefines: UPUserDefaulKey) -> Date?
    
    func removeObject(forDefines: UPUserDefaulKey)
}

extension UserDefaults: MPUserDefaultProtocol {
    // MARK: Set
    func set(_ value: Int, forDefines: UPUserDefaulKey) {
        set(value, forKey: forDefines.rawValue)
        synchronize()
    }
    
    func set(_ value: Float, forDefines: UPUserDefaulKey) {
        set(value, forKey: forDefines.rawValue)
        synchronize()
    }
    
    func set(_ value: Bool, forDefines: UPUserDefaulKey) {
        set(value, forKey: forDefines.rawValue)
        synchronize()
    }
    
    func set(_ value: Any?, forDefines: UPUserDefaulKey) {
        set(value, forKey: forDefines.rawValue)
        synchronize()
    }
    
    func set(_ value: Date, forDefines: UPUserDefaulKey) {
        set(value, forKey: forDefines.rawValue)
        synchronize()
    }
    
    
    // MARK: Get
    func integer(forDefines: UPUserDefaulKey) -> Int {
        return integer(forKey: forDefines.rawValue)
    }
    
    func float(forDefines: UPUserDefaulKey) -> Float {
        return float(forKey: forDefines.rawValue)
    }
    
    func bool(forDefines: UPUserDefaulKey) -> Bool {
        return bool(forKey: forDefines.rawValue)
    }
    
    func string(forDefines: UPUserDefaulKey) -> String? {
        return string(forKey: forDefines.rawValue)
    }
    
    func object(forDefines: UPUserDefaulKey) -> Any? {
        return object(forKey: forDefines.rawValue)
    }
    
    func array(forDefines: UPUserDefaulKey) -> [Any]? {
        return array(forKey: forDefines.rawValue)
    }
    
    func date(forDefines: UPUserDefaulKey) -> Date? {
        return value(forKey: forDefines.rawValue) as? Date
    }
    
    func removeObject(forDefines: UPUserDefaulKey) {
        self.removeObject(forKey: forDefines.rawValue)
    }
}

// MARK: - Extension UserDefaults
extension UserDefaults {
    var location: CLLocationCoordinate2D {
        if let dictionary = object(forDefines: .location) as? [String: CLLocationDegrees] {
            return CLLocationCoordinate2D.init(dict: dictionary)
        }
        return CLLocationCoordinate2D(latitude: 37.538778, longitude: 126.89520)
    }
    
}
