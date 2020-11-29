//
//  DetailInteractor.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol DetailBusinessLogic {
    func getFeed()
}

protocol DetailDataStore {
    var feed: Feed? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore{
    var presenter: DetailPresentationLogic?
    let worker = DetailWorker()
    
    var feed: Feed?
    
    func getFeed() {
        guard let feed = self.feed else { return }
        let response = Detail.GetFeed.Response(feed: feed)
        self.presenter?.presentGetFeed(response: response)
    }
    
    
}
