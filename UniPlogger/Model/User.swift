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
    /// 가입 날짜
    var registeredDate: String = ""
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
    var planet: Planet?
    /// 주간 상태
    var weeklyStat: String = ""
    /// 월간 상태
    var monthlyStat: Double = 0.0
    /// 푸시 동의 여부
    var agreePush: Bool = false
    /// 푸시 토큰
    var registrationToken: String = ""
    
    private enum CodingKeys: String, CodingKey {
        case id
        case registeredDate
        case email
        case nickname
        case level
        case rank
        case state
        case planet
        case weeklyStat = "weekly_stats"
        case monthlyStat = "monthly_stats"
        case agreePush = "agree_push"
        case registrationToken = "registration_token"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: User.CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        registeredDate = try container.decodeIfPresent(String.self, forKey: .registeredDate) ?? ""
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        nickname = try container.decodeIfPresent(String.self, forKey: .nickname) ?? ""
        level = try container.decodeIfPresent(Int.self, forKey: .level) ?? 0
        rank = try container.decodeIfPresent(Double.self, forKey: .rank) ?? 0
        state = try container.decodeIfPresent(UserState.self, forKey: .state) ?? .normal
        planet = try container.decodeIfPresent(Planet.self, forKey: .planet) ?? nil
        weeklyStat = try container.decodeIfPresent(String.self, forKey: .weeklyStat) ?? ""
        monthlyStat = try container.decodeIfPresent(Double.self, forKey: .monthlyStat) ?? 0.0
        agreePush = try container.decodeIfPresent(Bool.self, forKey: .agreePush) ?? false
        registrationToken = try container.decodeIfPresent(String.self, forKey: .registrationToken) ?? ""
        
    }
    
}

enum UserState: String, Codable{
    case normal = "N"
    case dormant = "D"
    case leaved = "L"
}
