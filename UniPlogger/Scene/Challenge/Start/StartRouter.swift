//
//  StartRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/13.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol StartRoutingLogic {
    func routeToChallenge(planet: Planet)
}

protocol StartDataPassing {
    var dataStore: StartDataStore? { get }
}

class StartRouter: NSObject, StartRoutingLogic, StartDataPassing {
    weak var viewController: StartViewController?
    var dataStore: StartDataStore?
    
    func routeToChallenge(planet: Planet) {
        let destinationVC = ChallengeViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToChallange(planet: planet, destination: &destinationDS)
        navigateToChallenge(source: viewController!, destination: destinationVC)
    }
    
    private func navigateToChallenge(source: StartViewController, destination: ChallengeViewController) {
//        destination.modalTransitionStyle = .crossDissolve
//        destination.modalPresentationStyle = .fullScreen
        source.navigationController?.setViewControllers([destination], animated: true)
//        source.present(destination, animated: true)
    }

    private func passDataToChallange(planet: Planet, destination: inout ChallengeDataStore) {
        destination.planet = planet
    }
}
