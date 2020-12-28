//
//  SettingModels.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

enum Setting{
    
    enum GetUser {
        struct Response{
            var user: User?
            var error: Common.CommonError?
        }
        
        struct ViewModel{
            var pushAgree: Bool
        }
    }
}
