//
//  Feed.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct Feed: Codable {
    var id: Int = -1
    var title: String = ""
    var date: String = ""
    var distance: Double = 0.0
    var time: Int = 0
    var photo: String = ""
}
