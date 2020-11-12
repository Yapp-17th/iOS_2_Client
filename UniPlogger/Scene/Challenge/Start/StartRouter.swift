//
//  StartRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/13.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

@objc protocol StartRoutingLogic {
    func routeToChallenge()
}

class StartRouter: NSObject, StartRoutingLogic {
    weak var viewController: StartViewController?
    
    func routeToChallenge() {
        let destinationVC = ChallengeViewController()
        navigateToChallenge(source: viewController!, destination: destinationVC)
    }
    
    private func navigateToChallenge(source: StartViewController, destination: ChallengeViewController) {
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .fullScreen
        source.present(destination, animated: true)
    }

}
