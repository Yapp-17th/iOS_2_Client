//
//  ManagedTrashCan+CoreDataProperties.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/02.
//  Copyright © 2020 손병근. All rights reserved.
//
//

import Foundation
import CoreData


extension ManagedTrashCan {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedTrashCan> {
        return NSFetchRequest<ManagedTrashCan>(entityName: "ManagedTrashCan")
    }

    @NSManaged public var isRemoved: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var address: String
}
