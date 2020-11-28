//
//  PloggingData.swift
//  UniPlogger
//
//  Created by woong on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct PloggingData {
    
    typealias TimeSet = (minutes: Int, seconds: Int)
    
    var distance: Measurement<UnitLength>
    /// second 단위
    var time: Int
    var items: [PloggingItemType]
    
    func timeSet() -> TimeSet {
        return (time/60, time%60)
    }
}
