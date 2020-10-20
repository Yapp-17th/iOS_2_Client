//
//  QuestModels.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit.UIImage

enum QuestModels {
    enum UseCase {
        
    }
    
    struct Reqeust {
        var state: QuestState
    }
    
    struct Response {
        var questList: [Quest]
    }
    
    struct ViewModel {
        struct QuestViewModel {
            var title: String
            var category: Quest.Category
            var cellImageImage: UIImage?
            var accessoryImage: UIImage?
            var backgroundColor: String
        }
        
        init() {
            categoryOfSection[0] = .training
            categoryOfSection[1] = .routine
        }
        
        private var questList = [Quest.Category: [QuestViewModel]]()
        private(set) var categoryOfSection = [Int: Quest.Category]()
        
        func numberOfSections() -> Int {
            return categoryOfSection.count
        }
        
        func numberOfQuest(in section: Int) -> Int {
            guard 0..<categoryOfSection.count ~= section else { return 0 }
            return questList[categoryOfSection[section]!]?.count ?? 0
        }
        
        func quest(at indexPath: IndexPath) -> QuestViewModel? {
            guard let section = categoryOfSection[indexPath.section] else { return nil }
            return questList[section]?[indexPath.row]
        }
        
        mutating func append(_ viewModel: QuestViewModel) {
            questList[viewModel.category, default: []].append(viewModel)
        }
        
        @discardableResult
        mutating func remove(at indexPath: IndexPath) -> QuestViewModel? {
            guard let category = categoryOfSection[indexPath.section] else { return nil }
            return questList[category]?.remove(at: indexPath.row)
        }
        
        subscript(indexPath: IndexPath) -> QuestViewModel? {
            guard let category = categoryOfSection[indexPath.section] else { return nil }
            return questList[category]?[indexPath.row]
        }
    }
}
