//
//  User.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct User: Codable{
    ///UID
    var id: Int = -1
    ///이메일
    var email: String = ""
    /// 닉네임
    var nickname: String = ""
    /// 레벨
    var level: Int = 0
    /// 랭킹
    var rank: Double = 0.0
    /// 유저 상태
    var state: UserState = .normal
    /// 행성
    
    ///경험치
    var experiements: Double = 0.0
    
    private enum CodingKeys: String, CodingKey {
        case id
        case email
        case nickname
        case level
        case rank
        case state
        case experiements
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: User.CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        nickname = try container.decodeIfPresent(String.self, forKey: .nickname) ?? ""
        level = try container.decodeIfPresent(Int.self, forKey: .level) ?? 0
        rank = try container.decodeIfPresent(Double.self, forKey: .rank) ?? 0
        state = try container.decodeIfPresent(UserState.self, forKey: .state) ?? .normal
        experiements = try container.decodeIfPresent(Double.self, forKey: .experiements) ?? 0.0
        
    }
    
}

enum UserState: String, Codable{
    case normal = "N"
    case dormant = "D"
    case leaved = "L"
}