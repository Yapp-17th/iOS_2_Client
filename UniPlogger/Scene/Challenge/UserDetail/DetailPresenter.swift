//
//  DetailPresenter.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol DetailPresentationLogic {
    func presentGetFeed(response: Detail.GetFeed.Response)
}

class DetailPresenter: DetailPresentationLogic{
    weak var viewController: DetailViewController?
    
    func presentGetFeed(response: Detail.GetFeed.Response) {
        let feed = response.feed
        
        let date = FormatDisplay.date(feed.date)
        let timeString = FormatDisplay.time(feed.time)
        let distanceString = FormatDisplay.distance(feed.distance)
        
        let viewModel = Detail.GetFeed.ViewModel(date: date, time: timeString, distance: distanceString, photo: feed.photo)
        viewController?.displayGetFeed(viewModel: viewModel)
    }
    
}
