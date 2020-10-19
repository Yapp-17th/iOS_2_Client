//
//  Quest.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

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

extension Quest: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Quest, rhs: Quest) -> Bool {
        return lhs.id == rhs.id
    }
}
