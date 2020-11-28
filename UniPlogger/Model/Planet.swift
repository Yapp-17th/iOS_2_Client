//
//  Planet.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Planet {
    var id: String
    var startDate: String
    var endDate: String
    var userCount: Int
    var players: [Player]
    
    private enum CodingKeys: String, CodingKey {
        case startDate = "start_date"
        case endDate = "end_date"
        case userCount = "user_count"
    }
}

