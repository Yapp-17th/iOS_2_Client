//
//  BaseResponse.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable{
    var message: String?
    var object: T?
    
    enum CodingKeys: String, CodingKey {
        case message
        case object
    }
}
