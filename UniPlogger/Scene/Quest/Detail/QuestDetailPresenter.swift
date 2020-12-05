//
//  QuestPresenter.swift
//  UniPlogger
//
//  Created by woong on 2020/11/07.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestDetailPresenterLogic {
    func presentDetail(quest: Quest, recommands: [Quest])
    func finish()
}

class QuestDetailPresenter {
    var viewController: QuestDetailDisplayLogic
    
    init(viewController: QuestDetailDisplayLogic) {
        self.viewController = viewController
    }
}

extension QuestDetailPresenter: QuestDetailPresenterLogic {
    func presentDetail(quest: Quest, recommands: [Quest]) {
        viewController.displayDetail(quest: quest, recommands: recommands)
    }
    
    func finish() {
        viewController.dismiss()
    }
}
