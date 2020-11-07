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
    
    // MARK: - Methods
    
    // MARK: Private
    
    private func index(of quest: Quest) -> Int? {
        return questList[quest.state]?.firstIndex(of: quest)
    }
    
    // MARK: Getter
    
    func quests(for state: State) -> [Quest] {
        guard state == .done else {
            return questList[state]?.sorted(by: { $0.category > $1.category }) ?? []
        }
        return questList[state] ?? []
    }
    
    func quest(at indexPath: IndexPath, in state: State) -> Quest? {
        guard let quests = questList[state],
            0..<quests.count ~= indexPath.row
        else {
            return nil
        }
        
        return quests[indexPath.row]
    }
    
    func numberOfCategory() -> Int {
        return questList.count
    }
    
    // MARK: Mutating
    
    mutating func append(_ quest: Quest) {
        questList[quest.state, default: []].append(quest)
    }
    
    mutating func append(contentsOf quests: [Quest]) {
        quests.forEach { questList[$0.state, default: []].append($0) }
    }
    
    @discardableResult
    mutating func remove(quest: Quest) -> Quest? {
        guard let index = index(of: quest) else {
            return nil
        }
        return questList[quest.state]?.remove(at: index)
    }
}
