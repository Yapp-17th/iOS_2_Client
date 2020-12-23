//
//  UserLogWorker.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class UserLogWorker {
    func updateRank(completion: @escaping () -> Void) {
        LogAPI.shared.updateRank { _ in
            completion()
        }
    }
    
    func updateLevel(completion: @escaping () -> Void) {
        LogAPI.shared.updateLevel { _ in
            completion()
        }
    }
    func getFeed(uid: Int, completion: @escaping(Log.GetFeed.Response) -> Void){
        LogAPI.shared.getUserFeed(uid: uid) { (response) in
            switch response{
            case let .success(value):
                if value.success, let feedList = value.data {
                    let response = Log.GetFeed.Response(feedList: feedList)
                    completion(response)
                } else {
                    let response = Log.GetFeed.Response(error: .server(value.message))
                    completion(response)
                }
            case let .failure(error):
                let response = Log.GetFeed.Response(error: .error(error))
                completion(response)
            }
        }
    }
    
    func getOtherUser(uid: Int, completion: @escaping(Log.GetUser.Response) -> Void) {
        LogAPI.shared.getOtherUser(uid: uid) { (response) in
            switch response {
            case let .success(value):
                if value.success, let user = value.data {
                    let response = Log.GetUser.Response(response: user)
                    completion(response)
                } else {
                    let res = Log.GetUser.Response(error: .server(value.message))
                    completion(res)
                }
            case let .failure(error):
                let response = Log.GetUser.Response(error: .error(error))
                completion(response)
            }
        }
    }
    
}
