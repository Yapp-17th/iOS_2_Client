//
//  PloggingItemType.swift
//  UniPlogger
//
//  Created by woong on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

enum PloggingItemType: String, CaseIterable {
    case paper
    case cartons
    case plastic
    case pet
    case vinyl
    case glass
    case can
    case general
}

extension PloggingItemType: CustomStringConvertible {
    var description: String {
        switch self {
            case .paper: return "종이"
            case .cartons: return "종이팩"
            case .plastic: return "플라스틱"
            case .pet: return "페트"
            case .vinyl: return "비닐류"
            case .glass: return "유리"
            case .can: return "캔류"
            case .general: return "일반쓰레기"
        }
    }
    
    var detailItems: [NSMutableAttributedString]{
        switch self {
        case .paper: return [
            NSMutableAttributedString().string("종이\n쇼핑백", font: .notoSans(ofSize: 12, weight: .bold)),
            NSMutableAttributedString().string("종이컵", font: .notoSans(ofSize: 12, weight: .bold)),
            NSMutableAttributedString().string("신문지", font: .notoSans(ofSize: 12, weight: .bold)),
            NSMutableAttributedString().string("책", font: .notoSans(ofSize: 12, weight: .bold)),
            NSMutableAttributedString().string("박스", font: .notoSans(ofSize: 12, weight: .bold))
            ]
            case .cartons: return [
                NSMutableAttributedString().string("우유팩", font: .notoSans(ofSize: 22, weight: .bold))
                ]
            case .plastic: return [
                NSMutableAttributedString().string("병류", font: .notoSans(ofSize: 12, weight: .bold)),
                NSMutableAttributedString().string("용기류", font: .notoSans(ofSize: 12, weight: .bold))
                    .string("\n(화장품, 물통 등)", font: .notoSans(ofSize: 10, weight: .bold)),
                NSMutableAttributedString().string("스티로폼", font: .notoSans(ofSize: 12, weight: .bold))
                ]
            case .pet: return [
                NSMutableAttributedString().string("음료병", font: .notoSans(ofSize: 22, weight: .bold))
                ]
            case .vinyl: return [
                NSMutableAttributedString().string("필름류", font: .notoSans(ofSize: 14, weight: .bold))
                    .string("\n(과자, 라면봉지)", font: .notoSans(ofSize: 10, weight: .bold)),
                NSMutableAttributedString().string("일회용", font: .notoSans(ofSize: 14, weight: .bold))
                    .string("\n비닐", font: .notoSans(ofSize: 14, weight: .bold)),
                NSMutableAttributedString().string("컵", font: .notoSans(ofSize: 14, weight: .bold))
                ]
            case .glass: return [
                NSMutableAttributedString().string("음료병", font: .notoSans(ofSize: 22, weight: .bold))
                ]
            case .can: return [
                NSMutableAttributedString().string("음로캔", font: .notoSans(ofSize: 14, weight: .bold)),
                NSMutableAttributedString().string("통조림", font: .notoSans(ofSize: 14, weight: .bold))
                    .string("\n캔", font: .notoSans(ofSize: 14, weight: .bold)),
                NSMutableAttributedString().string("부탄가스", font: .notoSans(ofSize: 14, weight: .bold))
                    .string("\n살충제용기", font: .notoSans(ofSize: 14, weight: .bold))
                ]
            case .general: return [
                NSMutableAttributedString().string("담배꽁초", font: .notoSans(ofSize: 14, weight: .bold)),
                NSMutableAttributedString().string("플라스틱", font: .notoSans(ofSize: 14, weight: .bold))
                    .string("\n빨대", font: .notoSans(ofSize: 14, weight: .bold)),
                NSMutableAttributedString().string("오염된", font: .notoSans(ofSize: 14, weight: .bold))
                    .string("\n쓰레기", font: .notoSans(ofSize: 14, weight: .bold))
                ]
        }
    }
    
    var detailInfo: NSMutableAttributedString?{
        switch self {
        case .paper:
            return NSMutableAttributedString()
                .string("젖지 않게 피고 묶어서 배출 스프링 등 다른 재질은 분리 배출", font: .notoSans(ofSize: 12, weight: .regular))
                .string("\n코팅된 종이/ 팩스용지/ 영수증은 일반쓰레기", font: .notoSans(ofSize: 12, weight: .bold) , color: .init(hexString: "#FF4D35"))
        case .cartons:
            return NSMutableAttributedString()
                .string("깨끗이 세척하고 압착하여 배출", font: .notoSans(ofSize: 12, weight: .regular))
        case .plastic:
            return NSMutableAttributedString()
                .string("깨끗이 세척하고 압착하여 배출\n분리배출 - 라벨에 표기된 분리배출법 참고\n스트로폼은 다른 플라스틱과 분리 배출", font: .notoSans(ofSize: 12, weight: .regular))
        case .pet:
            return NSMutableAttributedString()
                .string("깨끗이 세척하고 압착하여 배출\n분리배출 - 라벨에 표기된 분리배출법 참고", font: .notoSans(ofSize: 12, weight: .regular))
        case .vinyl:
            return NSMutableAttributedString()
                .string("재활용 표기가 있는 것과 없는 것을 분리배출\n- 배출시 각각 투명한 비닐에 담아 배출", font: .notoSans(ofSize: 12, weight: .regular))
        case .glass:
            return NSMutableAttributedString()
                .string("깨끗이 세척하고 압착하여 배출", font: .notoSans(ofSize: 12, weight: .regular))
                .string("\n식기/도자기류/불투명한 흰색 화장품 유리병", font: .notoSans(ofSize: 12, weight: .bold) , color: .init(hexString: "#FF4D35"))
                .string("은 일반쓰레기", font: .notoSans(ofSize: 12, weight: .regular))
                .string("\n깨진유리", font: .notoSans(ofSize: 12, weight: .bold) , color: .init(hexString: "#FF4D35"))
                .string("는 동사무소에서 폐기물 봉투를 구입하여 배출", font: .notoSans(ofSize: 12, weight: .regular))
        case .can:
            return NSMutableAttributedString()
                .string("깨끗이 세척하고 압착하여 배출\n음료/ 통조림캔 - 꼭지를 따서 캔 속에 넣어서 압착 배출\n부탄가스, 살충제 용기 - 구멍 뚫어 배출", font: .notoSans(ofSize: 12, weight: .regular))
        case .general:
            return NSMutableAttributedString()
                .string("쓰레기 종량제 봉투에 담아 정해진 배출장소에 배출", font: .notoSans(ofSize: 12, weight: .regular))
        }
    }
}
