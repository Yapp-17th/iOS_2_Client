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
    
    
    /// `State` 의 개수
    func numberOfCategory() -> Int {
        return questList.count
    }
    
    // MARK: Mutating
    
    mutating func append(_ quest: Quest) {
        guard quest.category == .routine else {
            switch quest.state {
                case .todo, .doing:
                    questList[quest.state, default: []].insert(quest, at: 0)
                case .done:
                    questList[quest.state, default: []].append(quest)
                default:
                    break
            }
            return
        }
        
        questList[quest.state, default: []].append(quest)
        
        if quest.state == .todo {
            questList[quest.state]?.sort(by: { $0.id < $1.id })
        }
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
