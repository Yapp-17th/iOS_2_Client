//
//  LogOutType.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum LogOutType: Int, CaseIterable {
    case logOut = 0, withdraw
    
    var description: String {
        switch self {
        case .logOut:
            return "로그아웃"
        case .withdraw:
            return "탈퇴"
        }
    }
    
}
