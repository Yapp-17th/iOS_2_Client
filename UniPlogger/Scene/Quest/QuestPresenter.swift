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
        
        var viewModel = QuestModels.ViewModel()
        
        for quest in response.questList {
            let questVM = QuestModels.ViewModel.QuestViewModel(
                                title: quest.title,
                                category: quest.category,
                                gradientLayer: questFactory.cellBackgroundLayer(for: quest.category),
                                cellImageImage: questFactory.cellImage(for: quest.state),
                                accessoryImage: questFactory.accessoryImage(for: quest.state)
                            )
            
            
            viewModel.append(questVM)
        }
        
        viewController.displayQuests(viewModel: viewModel)
    }
}
