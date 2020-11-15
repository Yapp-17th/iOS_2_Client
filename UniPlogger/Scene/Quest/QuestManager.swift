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
}

struct QuestManager: QuestManageable {
    private let trainingStepKey = "trainingStep"
    private var trainingStepInDB = 0
    
    var currentTrainingStep: Int {
        // return UserDefaults.standard.integer(forKey: trainingStepKey)
        return trainingStepInDB
    }
}
