//
//  QuestManager.swift
//  UniPlogger
//
//  Created by woong on 2020/11/15.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestManageable {
    func start(quest: Quest)
    func finish(plogging: PloggingData)
    func postCompleteIfSuccess(completed proceedingQuest: ProceedingQuest) -> Bool
}

class QuestManager: QuestManageable {
    var proceedingQuests = [ProceedingQuest]()
    var questChecker: QuestCheckable
    
    init(questChecker: QuestCheckable) {
        self.questChecker = questChecker
    }
    
    func start(quest: Quest) {
        proceedingQuests.append(ProceedingQuest(quest: quest))
    }
    
    func finish(plogging: PloggingData) {
        let completed = questChecker.finish(plogging: plogging)
        completed.forEach {
            postCompleteIfSuccess(completed: $0)
        }
    }
    
    @discardableResult
    func postCompleteIfSuccess(completed proceedingQuest: ProceedingQuest) -> Bool {
        guard proceedingQuest.quest.id != 6,
              proceedingQuest.quest.id != 8,
              proceedingQuest.quest.id != 10
        else {
            if proceedingQuest.completeCount >= 3 {
                NotificationCenter.default.post(name: .QuestDidComplete, object: nil, userInfo: [Quest.infoKey: proceedingQuest.quest])
                return true
            }
            return false
        }
        NotificationCenter.default.post(name: .QuestDidComplete, object: nil, userInfo: [Quest.infoKey: proceedingQuest.quest])
        return true
    }
}
