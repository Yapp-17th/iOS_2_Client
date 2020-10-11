//
//  QuestModels.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum QuestModels {
    enum UseCase {
        
    }
    
    struct Reqeust {
        var state: QuestState
    }
    
    struct Response {
        var questList: [Quest]
    }
    
    struct ViewModel {
        
        struct QuestViewModel {
            var title: String
            var category: Quest.Category
        }
        
        var questList: [QuestViewModel]
    }
}
