//
//  QuestList.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct QuestList {
    private var questTable = [Quest.Category: [QuestModels.ViewModel.QuestViewModel]]()
    private var sectionTable = [Int: Quest.Category]()
    
    func numberOfCategory() -> Int {
        return questTable.count
    }
    
    func numberOfQuestInSection(for section: Int) -> Int {
        guard let category = sectionTable[section] else {
            return 0
        }
        
        return questTable[category]?.count ?? 0
    }
    
    func category(for section: Int) -> Quest.Category? {
        return sectionTable[section]
    }
    
    init(viewModel: QuestModels.ViewModel) {
        questTable[.routine] = viewModel.routineQuestList
        questTable[.training] = viewModel.trainingQuestList
        
        sectionTable[0] = .training
        sectionTable[1] = .routine
    }
    
    // MARK: For Subscript
    
    subscript(indexPath: IndexPath) -> QuestModels.ViewModel.QuestViewModel? {
        guard let category = sectionTable[indexPath.section] else {
            return nil
        }

        return questTable[category]?[indexPath.row] ?? nil
    }
}
