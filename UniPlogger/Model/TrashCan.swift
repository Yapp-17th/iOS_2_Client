//
//  TrashCan.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/31.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation
import CoreData
struct TrashCan: Codable{
    ///위도
    var latitude: Double
    ///경도
    var longitude: Double
    ///삭제 되었는지에 대한 플래그
    var isRemoved: Bool
    ///CoreData에서 구분용으로 사용하기 위한 구분자
    var objectIDString: String? = ""
    
    private enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case isRemoved
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TrashCan.CodingKeys.self)
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude) ?? 0
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude) ?? 0
        isRemoved = try container.decodeIfPresent(Bool.self, forKey: .isRemoved) ?? false
    }
}
