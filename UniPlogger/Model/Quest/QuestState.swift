//
//  QuestState.swift
//  UniPlogger
//
//  Created by woong on 2020/10/20.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum QuestState: String, Codable {
    case todo = "TODO"
    case doing = "DOING"
    case done = "DONE"
    case abandon = "ABANDON"
}

extension QuestState: CustomStringConvertible {
    var description: String {
        switch self {
            case .todo: return "준비"
            case .doing: return "진행"
            case .done: return "완료"
            case .abandon: return "포기"
        }
    }
}
