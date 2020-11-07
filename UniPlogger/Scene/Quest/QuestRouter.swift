//
//  QuestRouter.swift
//  UniPlogger
//
//  Created by woong on 2020/11/07.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol QuestRoutingLogic {
    func routeToDetail(at indexPath: IndexPath, in state: QuestState)
}

protocol QuestDataPassing {
    var dataStore: QuestDataStore { get }
}

class QuestRouter: QuestDataPassing {
    weak var viewController: QuestViewController?
    var dataStore: QuestDataStore
    
    init(viewController: QuestViewController?, dataStore: QuestDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension QuestRouter: QuestRoutingLogic {
    func routeToDetail(at indexPath: IndexPath, in state: QuestState) {
        guard let quest = dataStore.questList.quest(at: indexPath, in: state),
              let source = viewController
        else {
            return
        }
        
        let questDetailVC = QuestDetailViewController()
        questDetailVC.configure(quest: quest)
        navigateToDetail(source: source, destination: questDetailVC)
    }
    
    // MARK: Navigte
    
    private func navigateToDetail(source: QuestViewController, destination: QuestDetailViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
