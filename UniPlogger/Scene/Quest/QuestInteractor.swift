//
//  QuestInteractor.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestBusinessLogic {
    func fetchQuest(request: QuestModels.Reqeust)
}

protocol QuestDataStore {
    var questList: QuestList { get }
}

class QuestInteractor: QuestDataStore {
    private var presenter: QuestPresentationLogic
    private var worker: QuestWorker
    private(set) var questList = QuestList(quests: [])
    
    init(presenter: QuestPresentationLogic, worker: QuestWorker) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension QuestInteractor: QuestBusinessLogic {
    func fetchQuest(request: QuestModels.Reqeust) {
        questList = QuestList(quests: worker.fetchData())
        
        presenter.presentQuestList(response: response)
    }
}
