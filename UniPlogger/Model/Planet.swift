//
//  Planet.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Planet: Codable {
    var id: Int = -1
    var startDate: String = ""
    var endDate: String
    var userCount: Int
    var players: [Player] = []
    
    private enum CodingKeys: String, CodingKey {
        case id
        case startDate = "start_date"
        case endDate = "end_date"
        case userCount = "user_cnt"
        case players
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Planet.CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        startDate = try container.decodeIfPresent(String.self, forKey: .startDate) ?? ""
        endDate = try container.decodeIfPresent(String.self, forKey: .endDate) ?? ""
        userCount = try container.decodeIfPresent(Int.self, forKey: .userCount) ?? 0
        players = try container.decodeIfPresent([Player].self, forKey: .players) ?? []
        
    }
}

