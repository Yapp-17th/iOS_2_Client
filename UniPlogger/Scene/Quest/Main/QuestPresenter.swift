//
//  QuestPresenter.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestPresentationLogic {
    func presentQuestList(response: QuestModels.Response)
    func remove(quest: Quest, at indexPath: IndexPath)
}

class QuestPresenter {
    private var viewController: QuestDisplayLogic
    private var questFactory: QuestCellMaker
    private var viewModel: QuestModels.ViewModel?
    
    init(viewController: QuestDisplayLogic, questFactory: QuestCellMaker) {
        self.viewController = viewController
        self.questFactory = questFactory
    }
    
    private func generateViewModel(for quest: Quest) -> QuestModels.ViewModel.QuestViewModel {
        
        let questVM = QuestModels.ViewModel.QuestViewModel(
                            title: quest.title,
                            category: quest.category,
                            cellImageImage: questFactory.cellImage(for: quest.state),
                            accessoryImage: questFactory.accessoryImage(for: quest.state),
                            backgroundColor: questFactory.cellBackgroundColor(for: quest.category)
                        )
        
        return questVM
    }
}

// MARK: - Quest PresentationLogic

extension QuestPresenter: QuestPresentationLogic {
    func remove(quest: Quest, at indexPath: IndexPath) {
        viewModel?.remove(at: indexPath)
        guard let viewModel = viewModel else { return }
        viewController.updateQuest(viewModel: viewModel, at: indexPath)
    }
    
    func presentQuestList(response: QuestModels.Response) {
        
        var viewModel = QuestModels.ViewModel()
        
        for quest in response.questList {
            let questVM = generateViewModel(for: quest)
            viewModel.append(questVM)
        }
        
        self.viewModel = viewModel
        viewController.displayQuests(viewModel: viewModel)
    }
}
