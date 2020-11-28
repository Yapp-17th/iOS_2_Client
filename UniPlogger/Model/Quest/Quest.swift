//
//  Quest.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Quest {
    
    /// Notification userInfo key
    static let infoKey = "QuestInfo"
    
    var id: Int
    var title: String
    var content: String
    var category: Category
    var step: Int?
    var state: QuestState! = .todo
    
    enum Category: String, Codable {
        case training = "T"
        case routine = "R"
    }
}

extension Quest: Codable {
    
}

extension Quest: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Quest, rhs: Quest) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Quest.Category: Comparable {
    static func < (lhs: Quest.Category, rhs: Quest.Category) -> Bool {
        switch (lhs, rhs) {
            case (.routine, .training):
                return true
            default:
                return false
        }
    }
}
