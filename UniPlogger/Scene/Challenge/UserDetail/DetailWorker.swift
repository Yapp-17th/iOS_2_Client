//
//  DetailWorker.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class DetailWorker {
    func deleteFeed(fid: Int, completion: @escaping () -> Void) {
        LogAPI.shared.deleteFeed(fid: fid) { (response) in
            switch response {
            case .success():
                completion()
            case let .failure(error):
                completion()
            }
        }
    }
}
