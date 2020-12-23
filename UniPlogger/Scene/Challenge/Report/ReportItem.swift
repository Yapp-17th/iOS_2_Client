//
//  ReportItem.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum ReportItem: Int, CaseIterable {
    case sexualDispleasure = 0, unrelated, duplicated, spam, disgusting
    
    var description: String {
        switch self {
        case .sexualDispleasure:
            return "성적 불쾌감"
        case .disgusting:
            return "혐오 사진"
        case .duplicated:
            return "같은 내용 도배"
        case .spam:
            return "스팸"
        case .unrelated:
            return "관계 없는 사진"
        }
    }
}
