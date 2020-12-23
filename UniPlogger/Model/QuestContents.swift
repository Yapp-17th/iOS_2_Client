//
//  QuestContents.swift
//  UniPlogger
//
//  Created by woong on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct QuestContents {
    static func contents(id: Int) -> String {
        switch id {
            case 1: return  "1km or 15분 이상 러닝,\n쓰레기 종류 1개 이상 줍기"
            case 2: return  "1km or 15분 이상 러닝,\n쓰레기 종류 2개 이상 줍기"
            case 3: return  "1.5km or 30분 이상 러닝,\n쓰레기 종류 2개 이상 줍기"
            case 4: return  "1.5km or 30분 이상 러닝,\n쓰레기 종류 3개 이상 줍기"
            case 5: return  "2km or 45분 이상 러닝,\n쓰레기 종류 3개 이상 줍기"
            case 6: return  "2km or 45분 이상 러닝, 쓰레기 종류\n3개 이상 줍기 (3회)"
            case 7: return  "2.5km or 1시간 이상 러닝,\n쓰레기 종류 4개 이상 줍기"
            case 8: return  "2.5km or 1시간 이상 러닝, 쓰레기 종류\n4개 이상 줍기 (3회)"
            case 9: return  "3km or 1.5시간 이상 러닝,\n쓰레기 종류 5개 이상 줍기"
            case 10: return  "3km or 1.5시간 이상 러닝,\n쓰레기 종류 5개 이상 줍기 (3회)"
            case 11: return "1달 동안 주 1회 이상 플로깅하기"
            case 12: return "1달 동안 총 10회 이상 플로깅하기"
            case 13: return "3달 동안 주 2회 이상 플로깅하기"
            case 14: return "3달 동안 총 30회 이상 플로깅하기"
            case 15: return "플로깅 총 횟수 25회 이상 달성하기"
            case 16: return "플로깅 총 거리 25km, 5시간 이상 달성하기"
            case 17: return "플로깅 총 횟수 50회 이상 달성하기"
            case 18: return "플로깅 총 거리 50km, 10시간 이상 달성하기"
            case 19: return "플로깅 총 횟수 100회 이상 달성하기"
            case 20: return "플로깅 총 거리 100km, 20시간 이상 달성하기"
            default: return ""
        }
    }
}
