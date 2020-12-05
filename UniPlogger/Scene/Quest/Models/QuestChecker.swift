//
//  QuestChecker.swift
//  UniPlogger
//
//  Created by woong on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

//    1. 학습 퀘스트 리스트
//    학습퀘스트 1단계. 1km or 15분 이상 러닝, 쓰레기 종류 1개 이상 줍기
//    학습퀘스트 2단계. 1km or 15분 이상 러닝, 쓰레기 종류 2개 이상 줍기
//    학습퀘스트 3단계. 1.5km or 30분 이상 러닝, 쓰레기 종류 2개 이상 줍기
//    학습퀘스트 4단계. 1.5km or 30분 이상 러닝, 쓰레기 종류 3개 이상 줍기
//    학습퀘스트 5단계. 2km or 45분 이상 러닝, 쓰레기 종류 3개 이상 줍기
//    학습퀘스트 6단계. 2km or 45분 이상 러닝, 쓰레기 종류 3개 이상 줍기 (3회)
//    학습퀘스트 7단계. 2.5km or 1시간 이상 러닝, 쓰레기 종류 4개 이상 줍기
//    학습퀘스트 8단계. 2.5km or 1시간 이상 러닝, 쓰레기 종류 4개 이상 줍기 (3회)
//    학습퀘스트 9단계. 3km or 1.5시간 이상 러닝, 쓰레기 종류 5개 이상 줍기
//    학습퀘스트 10단계. 3km or 1.5시간 이상 러닝, 쓰레기 종류 5개 이상 줍기 (3회)
    
//    11 습관 1 Step. 1달 동안 주 1회 이상 플로깅하기
//    12 습관 2 Step. 1달 동안 총 10회 이상 플로깅하기
//    13 습관 3 Step. 3달 동안 주 2회 이상 플로깅하기
//    14 습관 4 Step. 3달 동안 총 30회 이상 플로깅하기
//    15 누적 1 Step. 플로깅 총 횟수 25회 이상 달성하기
//    16 누적 2 Step. 플로깅 총 거리 25km, 5시간 이상 달성하기
//    17 누적 3 Step. 플로깅 총 횟수 50회 이상 달성하기
//    18 누적 4 Step. 플로깅 총 거리 50km, 10시간 이상 달성하기
//    19 누적 5 Step. 플로깅 총 횟수 100회 이상 달성하기
//    20 누적 6 Step. 플로깅 총 거리 100km, 20시간 이상 달성하기

protocol QuestCheckable {
    func isComplete(proceddingQuest: ProceedingQuest) -> Bool
    func finish(plogging: PloggingData) -> [ProceedingQuest]
}

class QuestChecker: QuestCheckable {
    var proceedingQuests: [ProceedingQuest]
    
    init(proceedingQuests: [ProceedingQuest] = []) {
        
        self.proceedingQuests = proceedingQuests
    }
    
    /// 플로깅을 완료하고 달성한 퀘스트들을 반환합니다.
    /// - Parameter plogging: 완료한 플로깅
    /// - Returns: 목표를 달성한 플로깅
    func finish(plogging: PloggingData) -> [ProceedingQuest]  {
        var completed = [ProceedingQuest]()
        proceedingQuests.forEach { proceedingQuest in
            proceedingQuest.append(plogging)
            
            if isComplete(proceddingQuest: proceedingQuest) {
                proceedingQuest.completeCount += 1
                completed.append(proceedingQuest)
            }
        }
        return completed
    }
    
    func isComplete(proceddingQuest: ProceedingQuest) -> Bool {
        switch proceddingQuest.questId {
            
            // 학습 퀘스트
            case 1:
                return (proceddingQuest.distance >= 100 || proceddingQuest.time >= 60 * 15) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 1
            case 2:
                return (proceddingQuest.distance >= 100 || proceddingQuest.time >= 60 * 15) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 2
            case 3:
                return (proceddingQuest.distance >= 150 || proceddingQuest.time >= 60 * 30) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 2
            case 4:
                return (proceddingQuest.distance >= 150 || proceddingQuest.time >= 60 * 30) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 3
            case 5:
                return (proceddingQuest.distance >= 200 || proceddingQuest.time >= 60 * 45) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 3
            case 6:
                return (proceddingQuest.distance >= 200 || proceddingQuest.time >= 60 * 45) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 3
            case 7:
                return (proceddingQuest.distance >= 250 || proceddingQuest.time >= 60 * 60) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 4
            case 8:
                return (proceddingQuest.distance >= 250 || proceddingQuest.time >= 60 * 60) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 4
            case 9:
                return (proceddingQuest.distance >= 300 || proceddingQuest.time >= 60 * 90) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 5
            case 10:
                return (proceddingQuest.distance >= 300 || proceddingQuest.time >= 60 * 90) &&
                    (proceddingQuest.pickedUpTrashs?.count ?? 0) >= 5
                
            // 상시 퀘스트
            case 11:
                let intervals = Calendar.current.intervalsOfWeek(from: 4)
                return intervals
                    .filter { interval in
                        guard let finishDates = proceddingQuest.finishDates else { return false }
                        return finishDates.contains(where: { interval.contains($0) })
                    }
                    .count > intervals.count
            case 12:
                let beforeOneMonth = Date().midnight.addingTimeInterval(-60*60*24*30)
                let range = beforeOneMonth...Date()
                guard let finishDates = proceddingQuest.finishDates else { return false }
                return finishDates.filter { range.contains($0) }.count > 10
            case 13:
                let intervals = Calendar.current.intervalsOfWeek(from: 4 * 3)
                return intervals
                    .filter { interval in
                        guard let finishDates = proceddingQuest.finishDates else { return false }
                        return finishDates.filter({ date in interval.contains(date) }).count >= 2
                    }
                    .count > intervals.count
            case 14:
                let beforeOneMonth = Date().midnight.addingTimeInterval(-60*60*24*30)
                let range = beforeOneMonth...Date()
                guard let finishDates = proceddingQuest.finishDates else { return false }
                return finishDates.filter { range.contains($0) }.count > 30
            case 15:
                return proceddingQuest.finishCount >= 25
            case 16:
                return proceddingQuest.finishCount >= 25 &&
                      proceddingQuest.time >= 60 * 60 * 5
            case 17:
                return proceddingQuest.finishCount >= 50
            case 18:
                return proceddingQuest.finishCount >= 50 &&
                      proceddingQuest.time >= 60 * 60 * 10
            case 19:
                return proceddingQuest.finishCount >= 100
            case 20:
                return proceddingQuest.finishCount >= 100 &&
                      proceddingQuest.time >= 60 * 60 * 20
            default:
                return false
        }
    }

}
