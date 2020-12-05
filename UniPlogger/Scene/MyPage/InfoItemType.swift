//
//  InfoItemType.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

enum InfoItemType: Int, CaseIterable {
    case signUpInfo = 0, setting, logout, policy
    
    var description: String {
        switch self {
        case .signUpInfo:
            return "가입정보"
        case .setting:
            return "환경설정"
        case .logout:
            return "로그아웃/탈퇴"
        case .policy:
            return "개인정보처리 방침"
        }
    }
    
    var nextScene: InfoBaseViewController {
        switch self {
        case .signUpInfo:
            return SignUpInfoViewController()
        case .setting:
            return SettingViewController()
        case .logout:
            return LogOutInfoViewController()
        case .policy:
            return PolicyViewController()
        }
    }
    
}
