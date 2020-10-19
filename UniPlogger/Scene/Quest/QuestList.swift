//
//  QuestList.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct QuestList {
    
    typealias State = QuestState
    
    private var questList = [State: [Quest]]()
    
    init(quests: [Quest]) {
        quests.forEach { questList[$0.state, default: []].append($0) }
        
    }
    
    func quests(for state: State) -> [Quest] {
        return questList[state] ?? []
    }
    
    func numberOfCategory() -> Int {
        return questList.count
    }
    
    mutating func append(_ quest: Quest) {
        questList[quest.state, default: []].append(quest)
    }
    
    mutating func append(contentsOf quests: [Quest]) {
        quests.forEach { questList[$0.state, default: []].append($0) }
    }
}
