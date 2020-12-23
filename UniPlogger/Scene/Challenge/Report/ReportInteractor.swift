//
//  ReportInteractor.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/02.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol ReportBusinessLogic {
    func report()
}

protocol ReportDataStore {
    var feed: Feed? { get set }
}

class ReportInteractor: ReportBusinessLogic, ReportDataStore {
    var presenter: ReportPresentationLogic?
    let worker = ReportWorker()
    
    var feed: Feed?
    
    func report() {
        guard let feed = feed else { return }
        worker.report(id: feed.id) { (response) in
            switch response {
            case true:
                print("success~ ")
            case false:
                print("fail to report")
            }
        }
    }
}
