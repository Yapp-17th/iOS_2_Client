//
//  Player.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Player {
    var id: String
    var email: String
    var nickname: String
    var planetScore: Double
    
    private enum CodingKeys: String, CodingKey {
        case planetScore = "planet_score"
    }
}
