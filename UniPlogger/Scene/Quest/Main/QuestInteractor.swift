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
    func change(state: QuestState)
    func moveToNextStageAt(_ indexPath: IndexPath, state: QuestState)
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
    func change(state: QuestState) {
        let quests = questList.quests(for: state)
        presenter.presentQuestList(response: .init(questList: quests))
    }
    
    func moveToNextStageAt(_ indexPath: IndexPath, state: QuestState) {
        guard var quest = questList.quest(at: indexPath, in: state) else { return }
        
        if state == .todo {
            questList.remove(quest: quest)
            quest.state = .doing
            questList.append(quest)
        } else if state == .doing {
            questList.remove(quest: quest)
            quest.state = .todo
            questList.append(quest)
        } else if state == .done {
            questList.remove(quest: quest)
        } else {
            return
        }
        
        presenter.remove(quest: quest, at: indexPath)
    }
    
    
    func fetchQuest(request: QuestModels.Reqeust) {
        questList = QuestList(quests: worker.fetchData())
        
        let response = QuestModels.Response(questList: questList.quests(for: request.state))
        
        presenter.presentQuestList(response: response)
    }
}
