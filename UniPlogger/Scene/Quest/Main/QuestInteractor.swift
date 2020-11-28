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
    func touchedQuestAccessoryAt(_ indexPath: IndexPath, state: QuestState)
}

protocol QuestDataStore {
    var questList: QuestList { get }
    var questManager: QuestManageable { get }
}

class QuestInteractor: QuestDataStore {
    private var presenter: QuestPresentationLogic
    private var worker: QuestWorker
    private(set) var questManager: QuestManageable
    private(set) var questList: QuestList
    
    init(presenter: QuestPresentationLogic,
         worker: QuestWorker,
         questManager: QuestManageable,
         questList: QuestList = QuestList(quests: [])) {
        
        self.presenter = presenter
        self.worker = worker
        self.questManager = questManager
        self.questList = questList
    }
}

extension QuestInteractor: QuestBusinessLogic {
    func change(state: QuestState) {
        let quests = questList.quests(for: state, currentTrainingStep: questManager.currentTrainingStep)
        presenter.presentQuestList(response: .init(questList: quests))
    }
    
    func touchedQuestAccessoryAt(_ indexPath: IndexPath, state: QuestState) {
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
        
        let response = QuestModels.Response(questList: questList.quests(for: request.state, currentTrainingStep: questManager.currentTrainingStep))
        
        presenter.presentQuestList(response: response)
    }
}
