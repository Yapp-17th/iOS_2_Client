//
//  Quest.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
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

struct Quest {
    var id: String
    var title: String
    var content: String
    var category: Category
    var state: QuestState
    
    enum Category {
        case training
        case routine
    }
}
