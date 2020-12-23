//
//  ReportRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/02.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

@objc protocol ReportRoutingLogic {
    
}

protocol ReportDataPassing {
    var dataStore: ReportDataStore? { get set }
}

class ReportRouter: NSObject, ReportRoutingLogic, ReportDataPassing {
    weak var viewController: ReportViewController?
    var dataStore: ReportDataStore?

}
