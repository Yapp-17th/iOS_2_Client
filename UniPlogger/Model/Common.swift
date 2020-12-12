//
//  Common.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/27.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

enum Common{
    enum CommonError: Error{
        case server(String?)
        case local(String)
        case error(Error)
    }
}
