//
//  DetailRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

@objc protocol DetailRoutingLogic {
    func routeToReport()
}

protocol DetailDataPassing{
    var dataStore: DetailDataStore? { get set }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
    func routeToReport() {
        let destinationVC = ReportViewController()
        navigateToDetail(source: viewController!, destination: destinationVC)
    }
    
    private func navigateToDetail(source: DetailViewController, destination: ReportViewController) {
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .overFullScreen
        source.present(destination, animated: true)
    }

}

