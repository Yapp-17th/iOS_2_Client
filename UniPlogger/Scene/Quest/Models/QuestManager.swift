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
    var storage: QuestStorageType
    var questChecker: QuestCheckable
    
    init(questChecker: QuestCheckable, storage: QuestStorageType) {
        self.questChecker = questChecker
        self.storage = storage
    }
    
    func start(quest: Quest) {
        storage.createProceedingQuest(for: quest) { (result) in
            switch result {
                case .success(_):
                    break
                case .failure(let error):
                    #if DEBUG
                    print(error)
                    #endif
            }
        }
    }
    
    func finish(plogging: PloggingData) {
        questChecker.finish(plogging: plogging) { [weak self] (completed) in
            completed.forEach {
                self?.postCompleteIfSuccess(completed: $0)
            }
        }
    }
    
    @discardableResult
    func postCompleteIfSuccess(completed proceedingQuest: ProceedingQuest) -> Bool {
        guard proceedingQuest.questId != 6,
              proceedingQuest.questId != 8,
              proceedingQuest.questId != 10
        else {
            if proceedingQuest.completeCount >= 3 {
                NotificationCenter.default.post(name: .QuestDidComplete, object: nil, userInfo: [Quest.infoKey: Int(proceedingQuest.questId)])
                storage.deleteProceedingQuest(proceedingQuest) { [weak self] (result) in
                    switch result {
                        case .success():
                            break
                        case .failure(let error):
                            #if DEBUG
                            print("fail delete proceeding Quest, \(error)")
                            #endif
                    }
                }
                return true
            }
            
            storage.updateProceedingQuest(proceedingQuest) { (result) in
                switch result {
                    case .success(_):
                        break
                    case .failure(let error):
                        #if DEBUG
                        print("fail update proceeding Quest, \(error)")
                        #endif
                }
            }
            return false
        }
        
        NotificationCenter.default.post(name: .QuestDidComplete, object: nil, userInfo: [Quest.infoKey: Int(proceedingQuest.questId)])
        storage.deleteProceedingQuest(proceedingQuest) { [weak self] (result) in
            switch result {
                case .success():
                    break
                case .failure(let error):
                    #if DEBUG
                    print("fail delete proceeding Quest, \(error)")
                    #endif
            }
        }
        return true
    }
}
