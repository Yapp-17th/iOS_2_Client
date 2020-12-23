//
//  ManagedTrashCan+CoreDataClass.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/02.
//  Copyright © 2020 손병근. All rights reserved.
//
//

import Foundation
import CoreData


public class ManagedTrashCan: NSManagedObject {
    func toTrashCan() -> TrashCan {
        let objectIdString = objectID.uriRepresentation().absoluteString
        return TrashCan(id: id, latitude: latitude, longitude: longitude, isRemoved: isRemoved, address: address, objectIDString: objectIdString)
    }
    
    func fromTrashCan(_ trashCan: TrashCan) {
        id = trashCan.id
        latitude = trashCan.latitude
        longitude = trashCan.longitude
        isRemoved = trashCan.state == .disalbed
        address = trashCan.address
    }
}
