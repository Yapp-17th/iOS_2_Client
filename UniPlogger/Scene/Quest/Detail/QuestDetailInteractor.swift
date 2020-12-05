//
//  QuestDetailInteractor.swift
//  UniPlogger
//
//  Created by woong on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestDetailBusinessLogic {
    func start(quest: Quest)
    func fetchDetail(quest: Quest)
}

class QuestDetailInteractor {
    var worker: QuestDetailWorker
    var presenter: QuestDetailPresenterLogic
    
    init(presenter: QuestDetailPresenterLogic, worker: QuestDetailWorker) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension QuestDetailInteractor: QuestDetailBusinessLogic {
    func start(quest: Quest) {
        worker.start(quest: quest) { [weak self] (success) in
            self?.presenter.finish()
        }
        
    }
    
    func fetchDetail(quest: Quest) {
        worker.detail(for: quest) { [weak self] (quest, recommands) in
            self?.presenter.presentDetail(quest: quest, recommands: recommands)
        }
    }
}
