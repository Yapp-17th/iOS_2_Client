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
    func showDetail(at indexPath: IndexPath, state: QuestState)
    func change(state: QuestState)
    func touchedQuestAccessory(at indexPath: IndexPath, state: QuestState)
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
        addObservers()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompletedQuest(_:)), name: .QuestDidComplete, object: nil)
    }
    
    @objc func onDidCompletedQuest(_ notification: Notification) {
        guard let questId = notification.userInfo?[Quest.infoKey] as? Int else { return }
        worker.success(questId: questId) { [weak self] quest in
            var quest = quest
            self?.questList.remove(quest: quest)
            quest.state = .done
            self?.questList.append(quest)
        }
    }
}

extension QuestInteractor: QuestBusinessLogic {
    
    func change(state: QuestState) {
        let quests = questList.quests(for: state)
        presenter.presentQuestList(response: .init(questList: quests))
    }
    
    func showDetail(at indexPath: IndexPath, state: QuestState) {
        guard let quest = questList.quest(at: indexPath, in: state) else { return }
        worker.detail(for: quest, completionHandler: { [weak self] quest, more in
            self?.presenter.presentDetail(quest: quest, recommands: more)
        })
    }
    
    func touchedQuestAccessory(at indexPath: IndexPath, state: QuestState) {
        UPLoader.shared.show()
        guard var quest = questList.quest(at: indexPath, in: state) else {
            UPLoader.shared.hidden()
            return
            
        }
        
        if state == .todo {
            questList.remove(quest: quest)
            quest.state = .doing
            questManager.start(quest: quest)
            worker.start(quest: quest)
            questList.append(quest)
        } else if state == .doing {
            worker.abandon(quest: quest)
            questList.remove(quest: quest)
            quest.state = .todo
            questList.append(quest)
        } else if state == .done {
            worker.delete(quest: quest)
            questList.remove(quest: quest)
        } else {
            UPLoader.shared.hidden()
            return
        }
        
        presenter.remove(quest: quest, at: indexPath)
    }
    
    
    func fetchQuest(request: QuestModels.Reqeust) {
        UPLoader.shared.show()
        worker.fetchData { [weak self] (quests) in
            guard let self = self else { return }
            self.questList = QuestList(quests: quests)
            self.questManager.startQuestIfNotProceeding(quests: self.questList.quests(for: .doing))
            let response = QuestModels.Response(questList: self.questList.quests(for: request.state))
            self.presenter.presentQuestList(response: response)
        }
    }
}
