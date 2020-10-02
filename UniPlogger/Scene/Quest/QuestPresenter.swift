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
    var viewController: QuestDisplayLogic?
}

extension QuestPresenter: QuestPresentationLogic {
    func presentQuestList(response: QuestModels.Response) {
        
        var questList = [QuestModels.ViewModel.QuestViewModel]()
        for quest in response.questList {
            questList.append(.init(title: quest.title, category: quest.category))
        }
        let viewModel = QuestModels.ViewModel(questList: questList)
        viewController?.displayQuests(viewModel: viewModel)
    }
}
