//
//  PloggingItemType.swift
//  UniPlogger
//
//  Created by woong on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

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
}
