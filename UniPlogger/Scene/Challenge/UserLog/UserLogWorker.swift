//
//  UserLogWorker.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class UserLogWorker {
    
    func getFeed(uid: Int, completion: @escaping(Log.GetFeed.Response) -> Void){
        LogAPI.shared.getUserFeed(uid: uid) { (response) in
            switch response{
            case let .success(feedList):
                let response = Log.GetFeed.Response(feedList: feedList)
                completion(response)
            case let .failure(error):
                let response = Log.GetFeed.Response(error: .error(error))
                completion(response)
            }
        }
    }
    
}
