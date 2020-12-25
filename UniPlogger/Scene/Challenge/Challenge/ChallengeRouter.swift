//
//  ChallengeRouter.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/26.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChallengeRoutingLogic {
    func routeToScoreInfo()
    func routeToUserLog(playerId: Int)
}

protocol ChallengeDataPassing {
    var dataStore: ChallengeDataStore? { get }
}

class ChallengeRouter: NSObject, ChallengeRoutingLogic, ChallengeDataPassing {

    weak var viewController: ChallengeViewController?
    var dataStore: ChallengeDataStore?
    
    func routeToScoreInfo() {
        let destinationVC = ScoreInfoViewController()
        navigateToScoreInfo(source: viewController!, destination: destinationVC)
    }
    
    func navigateToScoreInfo(source: ChallengeViewController, destination: ScoreInfoViewController) {
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .overFullScreen
        source.present(destination, animated: true)
    }
    
    func routeToUserLog(playerId: Int) {
        let destinationVC = UserLogViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToUserLog(playerId: playerId, destination: &destinationDS)
        navigateToUserLog(source: viewController!, destination: destinationVC)
    }
    
    func navigateToUserLog(source: ChallengeViewController, destination: UserLogViewController) {
        source.navigationController?.pushViewController(destination, animated: false)
    }
    
    func passDataToUserLog(playerId: Int, destination: inout UserLogDataStore) {
        destination.playerId = playerId
    }

}