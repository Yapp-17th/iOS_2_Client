//
//  QuestManager.swift
//  UniPlogger
//
//  Created by woong on 2020/11/15.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestManageable {
    var currentTrainingStep: Int { get }
    func nextStage()
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
    
    func nextStage() {
        let nextStage = currentTrainingStep + 1
        guard nextStage <= 10 else { return }
        UserDefaults.standard.setValue(nextStage, forKey: trainingStepKey)
    }
    
    func start(quest: Quest) {
        proceedingQuests.append(ProceedingQuest(id: quest.id))
    }
    
    func finish(plogging: PloggingData) {
        let completed = questChecker.finish(plogging: plogging)
        completed.forEach {
            if postCompleteIfSuccess(completed: $0), $0.id <= 10 {
                nextStage()
            }
        }
    }
    
    @discardableResult
    func postCompleteIfSuccess(completed proceedingQuest: ProceedingQuest) -> Bool {
        guard proceedingQuest.id != 6,
              proceedingQuest.id != 8,
              proceedingQuest.id != 10
        else {
            if proceedingQuest.completeCount >= 3 {
                // TODO: post
                return true
            }
            return false
        }
        // TODO: post
        return true
    }
    
    private let trainingStepKey = "trainingStep"
    
    var currentTrainingStep: Int {
        return UserDefaults.standard.integer(forKey: trainingStepKey)
    }
}
