//
//  QuestWorker.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class QuestWorker {
    
    private(set) var quests = [Quest]()
    
    //    11 습관 1 Step. 1달 동안 주 1회 이상 플로깅하기
    //    12 습관 2 Step. 1달 동안 총 10회 이상 플로깅하기
    //    13 습관 3 Step. 3달 동안 주 2회 이상 플로깅하기
    //    14 습관 4 Step. 3달 동안 총 30회 이상 플로깅하기
    //    15 누적 1 Step. 플로깅 총 횟수 25회 이상 달성하기
    //    16 누적 2 Step. 플로깅 총 거리 25km, 5시간 이상 달성하기
    //    17 누적 3 Step. 플로깅 총 횟수 50회 이상 달성하기
    //    18 누적 4 Step. 플로깅 총 거리 50km, 10시간 이상 달성하기
    //    19 누적 5 Step. 플로깅 총 횟수 100회 이상 달성하기
    //    20 누적 6 Step. 플로깅 총 거리 100km, 20시간 이상 달성하기
    
    func fetchData(completionHandler: @escaping ([Quest]) -> Void) {
        QuestAPI.shared.fetchQuestList { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let quests):
                    self.quests = self.filterTraining(for: quests)
                    completionHandler(self.quests)
                case .failure(let error):
                    debugPrint(error)
                    completionHandler([])
            }
        }
    }
    
    func filterTraining(for quests: [Quest]) -> [Quest] {
        var presentQuests = [Quest]()
        var haveTraining = false
        for quest in quests.sorted(by: { $0.id < $1.id }) {
            guard quest.category == .routine else {
                guard !haveTraining else { continue }
                if quest.state != .done {
                    presentQuests.append(quest)
                    haveTraining = true
                }
                continue
            }
            presentQuests.append(quest)
        }
        return presentQuests
    }
    
    func detail(for quest: Quest, completionHandler: @escaping (_ quest: Quest, _ more: [Quest]) -> Void) {
        QuestAPI.shared.detail(quest: quest) { (response) in
            completionHandler(response.quest, response.moreQuest ?? [])
        }
    }
    
    func start(quest: Quest) {
        QuestAPI.shared.start(quest: quest) { (success) in
            debugPrint(success)
        }
    }
    
    func abandon(quest: Quest) {
        QuestAPI.shared.abandon(quest: quest) { (success) in
            debugPrint(success)
        }
    }

    func delete(quest: Quest) {
        QuestAPI.shared.delete(quest: quest) { (success) in
            debugPrint(success)
        }
    }
    
    func success(quest: Quest) {
        QuestAPI.shared.success(quest: quest) { (success) in
            debugPrint(success)
        }
    }
}
