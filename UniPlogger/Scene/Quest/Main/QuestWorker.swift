//
//  QuestWorker.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class QuestWorker {
    
    var dataInDB: [Quest] = [
        
        Quest(id: 1, title: "학습퀘스트 1단계", content: "1km or 15분 이상 러닝, 쓰레기 종류 1개 이상 줍기", category: .training, step: 1, state: .todo),
        Quest(id: 2, title: "학습퀘스트 2단계", content: "1km or 15분 이상 러닝, 쓰레기 종류 2개 이상 줍기", category: .training, step: 2, state: .todo),
        Quest(id: 3, title: "학습퀘스트 3단계", content: "1.5km or 30분 이상 러닝, 쓰레기 종류 2개 이상 줍기", category: .training, step: 3, state: .todo),
        Quest(id: 4, title: "학습퀘스트 4단계", content: "1.5km or 30분 이상 러닝, 쓰레기 종류 3개 이상 줍기", category: .training, step: 4, state: .todo),
        Quest(id: 5, title: "학습퀘스트 5단계", content: "2km or 45분 이상 러닝, 쓰레기 종류 3개 이상 줍기", category: .training, step: 5, state: .todo),
        Quest(id: 6, title: "학습퀘스트 6단계", content: "2km or 45분 이상 러닝, 쓰레기 종류 3개 이상 줍기 (3회)", category: .training, step: 6, state: .todo),
        Quest(id: 7, title: "학습퀘스트 7단계", content: "2.5km or 1시간 이상 러닝, 쓰레기 종류 4개 이상 줍기", category: .training, step: 7, state: .todo),
        Quest(id: 8, title: "학습퀘스트 8단계", content: "2.5km or 1시간 이상 러닝, 쓰레기 종류 4개 이상 줍기 (3회)", category: .training, step: 8, state: .todo),
        Quest(id: 9, title: "학습퀘스트 9단계", content: "3km or 1.5시간 이상 러닝, 쓰레기 종류 5개 이상 줍기", category: .training, step: 9, state: .todo),
        Quest(id: 10, title: "학습퀘스트 10단계", content: "3km or 1.5시간 이상 러닝, 쓰레기 종류 5개 이상 줍기 (3회)", category: .training, step: 10, state: .todo),
        
        // Quest(id: 0, title: "학습퀘스트", content: "안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요", category: .training, state: .doing),
        Quest(id: 1, title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
        Quest(id: 2, title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
        Quest(id: 3, title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
        Quest(id: 4, title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
        Quest(id: 5, title: "목표달성형퀘스트", content: "", category: .routine, state: .doing),
        
        Quest(id: 6, title: "학습퀘스트", content: "1km or 15분 이상 러닝,\n쓰레기 종류 1개 이상 줍기", category: .training, state: .todo),
        Quest(id: 7, title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
        Quest(id: 8, title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
        Quest(id: 9, title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
        Quest(id: 10, title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
        Quest(id: 11, title: "목표달성형퀘스트", content: "", category: .routine, state: .todo),
        
        Quest(id: 12, title: "학습퀘스트", content: "완료해봅시다", category: .training, state: .done),
        Quest(id: 13, title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
        Quest(id: 14, title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
        Quest(id: 15, title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
        Quest(id: 16, title: "목표달성형퀘스트", content: "", category: .routine, state: .done),
        Quest(id: 17, title: "목표달성형퀘스트", content: "", category: .routine, state: .done)
    ]
    
    func fetchData() -> [Quest] {
        
        
        
        return dataInDB
    }
}
