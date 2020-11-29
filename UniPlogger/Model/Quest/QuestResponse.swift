//
//  QuestResponse.swift
//  UniPlogger
//
//  Created by woong on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct QuestResponse: Codable {
    var id: Int
    var state: QuestState
    var uid: Int
    var quest: Quest
    var moreQuest: [Quest]?
    
    enum CodingKeys: String, CodingKey {
        case id, state = "state", uid, quest = "qid", moreQuest = "more_quest"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.state = try container.decode(QuestState.self, forKey: .state)
        self.uid = try container.decode(Int.self, forKey: .uid)
        self.quest = try container.decode(Quest.self, forKey: .quest)
        self.quest.state = state
        self.moreQuest = try? container.decode([Quest]?.self, forKey: .moreQuest)
        moreQuest?.enumerated().forEach { moreQuest?[$0.offset].state = .todo }
    }
}

