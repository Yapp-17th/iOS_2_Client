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
        
        var trainingQuestList = [QuestModels.ViewModel.QuestViewModel]()
        var routineQuestList = [QuestModels.ViewModel.QuestViewModel]()
        
        for quest in response.questList {
            let viewModel = QuestModels.ViewModel.QuestViewModel(
                                title: quest.title,
                                category: quest.category,
                                gradientLayer: questFactory.cellBackgroundLayer(for: quest.category),
                                cellImageImage: questFactory.cellImage(for: quest.state),
                                accessoryImage: questFactory.accessoryImage(for: quest.state)
                            )
            
            
            switch viewModel.category {
                case .training:
                    trainingQuestList.append(viewModel)
                case .routine:
                    routineQuestList.append(viewModel)
            }
        }
        
        let viewModel = QuestModels.ViewModel(trainingQuestList: trainingQuestList, routineQuestList: routineQuestList)
        viewController.displayQuests(viewModel: viewModel)
    }
}
