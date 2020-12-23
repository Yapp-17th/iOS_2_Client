//
//  DetailModels.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum Detail{
    enum UseCase{
        
    }
    
    enum GetFeed{
        struct Response{
            var feed: Feed
        }
        
        struct ViewModel{
            var uid: Int
            var date: Date
            var time: String
            var distance: String
            var photo: String
        }
    }
}
