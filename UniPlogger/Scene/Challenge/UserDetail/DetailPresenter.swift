//
//  DetailPresenter.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol DetailPresentationLogic {
    func presentGetFeed(response: Detail.GetFeed.Response, uid: Int)
}

class DetailPresenter: DetailPresentationLogic{
    weak var viewController: DetailViewController?
    
    func presentGetFeed(response: Detail.GetFeed.Response, uid: Int) {
        let feed = response.feed

        let date = FormatDisplay.date(feed.date)
        let timeString = FormatDisplay.time(feed.time)
        let distanceString = FormatDisplay.distance(feed.distance)
        
        let viewModel = Detail.GetFeed.ViewModel(uid: uid, date: date, time: timeString, distance: distanceString, photo: feed.photo)
        viewController?.displayGetFeed(viewModel: viewModel, uid: uid)
    }
    
}
