//
//  SignUpInfoType.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum SignUpInfoType: Int, CaseIterable {
    case email = 0, resteredDate
    
    var description: String {
        switch self {
        case .email:
            return "이메일"
        case .resteredDate:
            return "가입일자"
        }
    }
    
}
