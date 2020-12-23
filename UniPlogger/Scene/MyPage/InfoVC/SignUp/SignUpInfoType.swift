//
//  SignUpInfoType.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum SignUpInfoType: Int, CaseIterable {
    case nickname = 0, email, resteredDate
    
    var description: String {
        switch self {
        case .nickname:
            return "닉네임"
        case .email:
            return "이메일"
        case .resteredDate:
            return "가입일자"
        }
    }
    
}
