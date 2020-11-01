//
//  QuestModels.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit.UIImage

enum QuestModels {
    enum UseCase {
        
    }
    
    struct Reqeust {
        var state: QuestState
    }
    
    struct Response {
        var questList: [Quest]
    }
}
