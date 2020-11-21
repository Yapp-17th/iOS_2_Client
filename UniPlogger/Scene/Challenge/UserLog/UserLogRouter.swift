//
//  UserLogRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

@objc protocol UserLogRoutingLogic {
    func routeToDetail()
}

class UserLogRouter: NSObject, UserLogRoutingLogic {
    weak var viewController: UserLogViewController?
    
    func routeToDetail() {
        let destinationVC = DetailViewController()
        navigateToDetail(source: viewController!, destination: destinationVC)
    }
    
    private func navigateToDetail(source: UserLogViewController, destination: DetailViewController) {
        source.navigationController?.pushViewController(destination, animated: false)
    }

}
