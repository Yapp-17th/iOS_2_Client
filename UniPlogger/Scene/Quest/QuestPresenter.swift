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
}

class QuestPresenter {
    private var viewController: QuestDisplayLogic
    private var questFactory: QuestCellMaker
    
    init(viewController: QuestDisplayLogic, questFactory: QuestCellMaker) {
        self.viewController = viewController
        self.questFactory = questFactory
    }
}

extension QuestPresenter: QuestPresentationLogic {
    func presentQuestList(response: QuestModels.Response) {
        
        var questList = [QuestModels.ViewModel.QuestViewModel]()
        for quest in response.questList {
            let viewModel = QuestModels.ViewModel.QuestViewModel(
                                title: quest.title,
                                category: quest.category,
                                cellImageImage: questFactory.cellImage(for: quest.state),
                                accessoryImage: questFactory.accessoryImage(for: quest.state)
                            )
            
            questList.append(viewModel)
        }
        let viewModel = QuestModels.ViewModel(questList: questList)
        viewController.displayQuests(viewModel: viewModel)
    }
}
