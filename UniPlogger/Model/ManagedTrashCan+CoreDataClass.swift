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
        return TrashCan(latitude: latitude, longitude: longitude, isRemoved: isRemoved, objectIDString: objectIdString)
    }
    
    func fromTrashCan(_ trashCan: TrashCan) {
        latitude = trashCan.latitude
        longitude = trashCan.longitude
        isRemoved = trashCan.isRemoved
    }
}
