//
//  FormatDisplay.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct FormatDisplay{
    static func distance(_ distance: Double) -> String{
        let distanceMeasurement = Measurement(value: distance, unit: UnitLength.kilometers)
        return FormatDisplay.distance(distanceMeasurement)
    }
    
    static func distance(_ distance: Measurement<UnitLength>) -> String{
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 2
        return formatter.string(from: distance)
    }
    
    static func time(_ seconds: Int) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "mm:ss"
        return formatter.string(from: Date().addingTimeInterval(TimeInterval(seconds)))
    }
    
    static func pace(distance: Measurement<UnitLength>, seconds: Int, outputUnit: UnitSpeed) -> String{
        let formatter = MeasurementFormatter()
        formatter.unitOptions = [.providedUnit]
        let speedMagnitude = seconds != 0 ? distance.value / Double(seconds) : 0
        let speed = Measurement(value: speedMagnitude, unit: UnitSpeed.metersPerSecond)
        return formatter.string(from: speed.converted(to: outputUnit))
    }
}
