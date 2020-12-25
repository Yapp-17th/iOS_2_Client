//
//  QuestModels+ViewModel.swift
//  UniPlogger
//
//  Created by woong on 2020/11/01.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension QuestModels {
    struct ViewModel {
        
        // MARK: Constants
        
        struct CellSize {
            static let trainingHeight: CGFloat = 176 + 20
            static let routineHeight: CGFloat = 88 + 20
        }
        
        struct QuestViewModel {
            var title: String
            var content: String
            var category: Quest.Category
            var cellImage: UIImage?
            var cellImageBackground: UIColor?
            var accessoryImage: UIImage?
            var backgroundColor: String
        }
        
        // MARK: - Properties
        
        private var questList = [QuestViewModel]()
        
        // MARK: - Methods
        
        // MARK: Getter
        
        func numberOfSections() -> Int {
            return 1
        }
        
        func numberOfQuest(in section: Int) -> Int {
            guard section == 0 else { return 0 }
            return questList.count
        }
        
        func quest(at indexPath: IndexPath) -> QuestViewModel? {
            guard isInRagne(for: indexPath) else { return nil }
            return questList[indexPath.row]
        }
        
        func height(at indexPath: IndexPath) -> CGFloat {
            guard isInRagne(for: indexPath) else { return .zero }
            return questList[indexPath.row].category == .training ?
                    CellSize.trainingHeight :
                    CellSize.routineHeight
        }
        
        // MARK: Mutating
        
        mutating func append(_ viewModel: QuestViewModel) {
            questList.append(viewModel)
        }
        
        // MARK: Private
        
        private func isInRagne(for indexPath: IndexPath) -> Bool {
            return 0..<questList.count ~= indexPath.row && indexPath.section == 0
        }
        
        @discardableResult
        mutating func remove(at indexPath: IndexPath) -> QuestViewModel? {
            guard isInRagne(for: indexPath) else { return nil }
            return questList.remove(at: indexPath.row)
        }
        
        subscript(indexPath: IndexPath) -> QuestViewModel? {
            guard isInRagne(for: indexPath) else { return nil }
            return questList[indexPath.row]
        }
    }
}
