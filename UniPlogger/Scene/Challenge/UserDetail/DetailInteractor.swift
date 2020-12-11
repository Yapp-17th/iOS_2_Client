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
    func shareToInstagram(assetIdentifier: String)
}

protocol DetailDataStore {
    var feed: Feed? { get set }
    var uid: Int? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore{
    var presenter: DetailPresentationLogic?
    let worker = DetailWorker()
    
    var feed: Feed?
    var uid: Int?
    
    func getFeed() {
        guard let feed = self.feed, let uid = self.uid else { return }
        let response = Detail.GetFeed.Response(feed: feed)
        self.presenter?.presentGetFeed(response: response, uid: uid)
    }
    
    func shareToInstagram(assetIdentifier: String) {
        guard let url = URL(string: "instagram://library?LocalIdentifier=\(assetIdentifier)") else { return }
        DispatchQueue.main.async {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            } else {
                print("Instagram is not installed")
            }
        }
    }
    
}
