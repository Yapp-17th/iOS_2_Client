//
//  Contacts+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/06.
//  Copyright © 2020 손병근. All rights reserved.
//

import Contacts
import CoreLocation

extension Formatter {
    static let mailingAddress: CNPostalAddressFormatter = {
        let formatter = CNPostalAddressFormatter()
        formatter.style = .mailingAddress
        return formatter
    }()
}

extension CLPlacemark {
    var mailingAddress: String? {
        return postalAddress?.mailingAddress
    }
}

extension CNPostalAddress {
    var mailingAddress: String {
        return Formatter.mailingAddress.string(from: self)
    }
}
extension CLLocation{
    func geocode(completion: @escaping (_ placemark: [CLPlacemark]?, _ error: Error?) -> Void)  {
            CLGeocoder().reverseGeocodeLocation(self, completionHandler: completion)
        }
    func addressToPlace(completion: @escaping (String) -> Void){
        self.geocode { placemark, error in
            if let error = error as? CLError {
                DispatchQueue.main.async {
                    completion("주소를 찾을 수 없습니다.")
                }
            } else if let placemark = placemark?.first {
                DispatchQueue.main.async {
                    var str = ""
                    [placemark.country, placemark.administrativeArea, placemark.locality, placemark.name, placemark.postalCode].forEach{
                        if let addr = $0{
                            str += addr
                            str += " "
                        }
                    }
                    completion(str)
                }
            }
        }
    }
}
