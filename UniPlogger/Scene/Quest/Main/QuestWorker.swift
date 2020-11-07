//
//  QuestWorker.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class QuestWorker {
    
    func fetchData() -> [Quest] {
        let data: [Quest] = [
            Quest(id: "0", title: "학습퀘스트", content: "", category: .training, state: .doing),
            Quest(id: "1", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "2", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "3", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "4", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            Quest(id: "5", title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
            
            Quest(id: "6", title: "학습퀘스트", content: "", category: .training, state: .todo),
            Quest(id: "7", title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
            Quest(id: "8", title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
            Quest(id: "9", title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
            Quest(id: "10", title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
            Quest(id: "11", title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
            
            Quest(id: "12", title: "학습퀘스트", content: "", category: .training, state: .done),
            Quest(id: "13", title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
            Quest(id: "14", title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
            Quest(id: "15", title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
            Quest(id: "16", title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
            Quest(id: "17", title: "목표달성형퀘스트", content: "", category: .routine, state: .done)
        ]
        
        return data
    }
}
