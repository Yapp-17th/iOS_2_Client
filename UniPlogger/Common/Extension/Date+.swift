//
//  Date+.swift
//  UniPlogger
//
//  Created by woong on 2020/11/22.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension Date {
    var midnight: Date {
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
}
