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
    var questList: [Quest] { get set }
}

class QuestInteractor: QuestDataStore {
    var presenter: QuestPresentationLogic?
    var worker: QuestWorker?
    var questList = [Quest]()
}

extension QuestInteractor: QuestBusinessLogic {
    func fetchQuest(request: QuestModels.Reqeust) {
        worker = QuestWorker()
        let list = worker?.questData(state: request.state)
        let response = QuestModels.Response(questList: list ?? [])
        presenter?.presentQuestList(response: response)
    }
}
