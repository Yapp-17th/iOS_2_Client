//
//  Calendar+.swift
//  UniPlogger
//
//  Created by woong on 2020/11/22.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension Calendar {
    /// 주 단위 interval을 구하는 메소드
    /// - Parameter week: 몇 주 전부터 구할 지 입력 (이번 주 = 1)
    func intervalsOfWeek(from week: Int) -> [DateInterval] {
        var intervals = [DateInterval]()
        for beforeWeek in 0..<week {
            guard let interval = intervalOfWeek(for: Date().addingTimeInterval(-86400*7*Double(beforeWeek))) else { continue }
            intervals.append(interval)
        }
        return intervals
    }
    
    func intervalOfWeek(for date: Date) -> DateInterval? {
        return self.dateInterval(of: .weekOfYear, for: date)
    }
}
