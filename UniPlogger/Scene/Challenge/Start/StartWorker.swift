//
//  StartWorker.swift
//  UniPlogger
//
//  Created by 고세림 on 2021/01/05.
//  Copyright © 2021 손병근. All rights reserved.
//

import Foundation

class StartWorker {
  
    func startChallenge(completion: @escaping (Bool) -> Void) {
        ChallengeAPI.shared.startChallenge { (result) in
            print("startChallenge")
            switch result {
            case .success(let data):
                completion(data.data!)
            case .failure(let error):
                let error = Common.CommonError.error(error)
                print(error)
            }
        }
    }
    
    func getPlanet(completion: @escaping (Planet) -> Void) {
        ChallengeAPI.shared.fetchPlanet { (response) in
            switch response {
            case .success(let value):
                if value.success, let data = value.data {
                    guard let data = data else { return }
                    var user = AuthManager.shared.user
                    user?.planet = data
                    AuthManager.shared.user = user
                    completion(data)
                }
                
            case .failure(let error):
                let error = Common.CommonError.error(error)
                print(error)
            }
        }
    }
    
}
