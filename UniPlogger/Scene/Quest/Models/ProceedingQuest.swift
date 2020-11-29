//
//  ProceedingQuest.swift
//  UniPlogger
//
//  Created by woong on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class ProceedingQuest {
    private(set) var quest: Quest
    /// time 1 = 1초
    private(set) var time: Int
    /// distance 1 = 10m
    private(set) var distance: Double
    private(set) var pickedUpTrashs: [PloggingItemType: Int]
    /// 완료 날짜
    private(set) var finishDates: [Date]
    /// 플로깅 완료 횟수
    private(set) var finishCount: Int
    /// 미션 달성 횟수
    var completeCount: Int
    
    init(quest: Quest,
         time: Int = 0,
         distance: Double = 0,
         pickedUpTrashs: [PloggingItemType: Int] = [:],
         finishDates: [Date] = [],
         completeCount: Int = 0,
         finishCount: Int = 0) {
        
        self.quest = quest
        self.time = time
        self.distance = distance
        self.pickedUpTrashs = pickedUpTrashs
        self.finishDates = finishDates
        self.completeCount = completeCount
        self.finishCount = finishCount
    }
    
    func append(_ ploggingData: PloggingData) {
        time += ploggingData.time
        #warning("거리 수정바람")
        // distance += ploggingData.distance
        
        finishDates.append(Date())
        finishCount += 1
        ploggingData.items.forEach { item in
            pickedUpTrashs[item, default: 0] += 1
        }
    }
}
