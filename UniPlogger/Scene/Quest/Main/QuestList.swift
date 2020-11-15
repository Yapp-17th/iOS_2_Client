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
    private var questManager: QuestManageable?
    
    init(questManager: QuestManageable, quests: [Quest]) {
        self.questManager = questManager
        quests.forEach { questList[$0.state, default: []].append($0) }
    }
    
    // MARK: - Methods
    
    // MARK: Private
    
    private func index(of quest: Quest) -> Int? {
        return questList[quest.state]?.firstIndex(of: quest)
    }
    
    // MARK: Getter
    
    
    /// 현재 state의 quest 리스트
    /// - Parameter state: QuestState
    /// - Returns: state가 done이 아닐 땐 training이 상단에 위치
    func quests(for state: State) -> [Quest] {
        switch state {
            case .todo:
                let isNotDoingTraining = !(questList[.doing]?.contains(where: { $0.category == .training }) ?? false)
                return questList[state]?.filter { quest in
                        guard quest.category == .training else { return true }
                        guard isNotDoingTraining else { return false }
                        
                        return quest.step == (questManager?.currentTrainingStep ?? 0) + 1
                    }
                    .sorted(by: { $0.category > $1.category }) ?? []
            case .doing:
                return questList[state]?.sorted(by: { $0.category > $1.category }) ?? []
            case .done:
                return questList[state] ?? []
            default: return []
        }
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
