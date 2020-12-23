//
//  ReportWorker.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/02.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class ReportWorker {
    
    func report(id: Int, completion: @escaping (Bool) -> Void) {
        ChallengeAPI.shared.report(id: id) { (response) in
            switch response {
            case .success(let data):
                print(data)
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
