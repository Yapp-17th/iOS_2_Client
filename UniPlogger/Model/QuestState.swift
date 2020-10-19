//
//  QuestState.swift
//  UniPlogger
//
//  Created by woong on 2020/10/20.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum QuestState {
    case todo
    case doing
    case done
    case abandon
}

extension QuestState: CustomStringConvertible {
    var description: String {
        switch self {
            case .todo: return "To Do"
            case .doing: return "Doing"
            case .done: return "Done"
            case .abandon: return "Abandon"
        }
    }
}
