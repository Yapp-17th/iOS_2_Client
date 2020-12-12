//
//  QuestDetailWorker.swift
//  UniPlogger
//
//  Created by woong on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class QuestDetailWorker {
    
    func start(quest: Quest, completionHandler: @escaping (Bool) -> Void) {
        QuestAPI.shared.start(quest: quest) { (success) in
            guard success == 200 else {
                debugPrint(success)
                return
            }
            completionHandler(true)
        }
    }
    
    func abandon(quest: Quest, completionHandler: @escaping (Bool) -> Void) {
        QuestAPI.shared.abandon(quest: quest) { (success) in
            guard success == 200 else {
                #if DEBUG
                print("abandon success, quest: \(quest)")
                #endif
                return
            }
            completionHandler(true)
        }
    }
    
    func detail(for quest: Quest, completionHandler: @escaping (_ quest: Quest, _ more: [Quest]) -> Void) {
        QuestAPI.shared.detail(quest: quest) { (response) in
            switch response{
            case let .success(value):
                if value.success, let questResponse = value.data{
                    completionHandler(questResponse.quest, questResponse.moreQuest ?? [])
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
            
        }
    }
}
