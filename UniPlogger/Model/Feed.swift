//
//  Feed.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Feed: Codable {
    var id: Int = -1
    var title: String = ""
    var date: String = ""
    var distance: Double = 0.0
    var time: Int = 0
    var photo: String = ""
    var user: User?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case date
        case distance
        case time
        case photo
        case user
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Feed.CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        date = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        distance = try container.decodeIfPresent(Double.self, forKey: .distance) ?? 0.0
        time = try container.decodeIfPresent(Int.self, forKey: .time) ?? 0
        photo = try container.decodeIfPresent(String.self, forKey: .photo) ?? ""
        user = try container.decodeIfPresent(User.self, forKey: .user)
    }
}
