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

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get set }
}

class DetailRouter: NSObject, DetailRoutingLogic, DetailDataPassing {
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?

    func routeToReport() {
        let destinationVC = ReportViewController()
        var destinationDS = destinationVC.router!.dataStore!
        
        passDataToReport(source: dataStore!, destination: &destinationDS)
        navigateToReport(source: viewController!, destination: destinationVC)
    }
    
    private func navigateToReport(source: DetailViewController, destination: ReportViewController) {
        destination.modalTransitionStyle = .crossDissolve
        destination.modalPresentationStyle = .overFullScreen
        source.present(destination, animated: true)
    }
    
    func passDataToReport(source: DetailDataStore, destination: inout ReportDataStore) {
        destination.feed = self.dataStore?.feed
    }
    
}

