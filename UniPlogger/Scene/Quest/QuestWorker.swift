//
//  QuestWorker.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class QuestWorker {
    
    func questData(state: QuestState) -> [Quest] {
        let data: [Quest] = [
            Quest(id: "0", title: "학습퀘스트", content: "", category: .training, state: .doing),
            Quest(id: "1", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "2", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "3", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "4", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "5", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing)
        ]
        
        return data
    }
}
