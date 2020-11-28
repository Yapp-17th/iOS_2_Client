//
//  SettingType.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum SettingType: Int, CaseIterable {
    case push = 0, autosave
    
    var description: String {
        switch self {
        case .push:
            return "가입정보"
        case .autosave:
            return "환경설정"
        }
    }
    
}
