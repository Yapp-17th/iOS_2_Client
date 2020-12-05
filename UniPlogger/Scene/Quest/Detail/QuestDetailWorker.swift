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
    
    func detail(for quest: Quest, completionHandler: @escaping (_ quest: Quest, _ more: [Quest]) -> Void) {
        QuestAPI.shared.detail(quest: quest) { (response) in
            completionHandler(response.quest, response.moreQuest ?? [])
        }
    }
}
