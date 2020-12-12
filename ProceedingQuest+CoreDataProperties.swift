//
//  ProceedingQuest+CoreDataProperties.swift
//  UniPlogger
//
//  Created by woong on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//
//

import Foundation
import CoreData


extension ProceedingQuest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProceedingQuest> {
        return NSFetchRequest<ProceedingQuest>(entityName: "ProceedingQuest")
    }
    
    @NSManaged public var email: String
    @NSManaged public var questId: Int16
    @NSManaged public var time: Int64
    @NSManaged public var distance: Double
    @NSManaged public var finishDates: [Date]?
    @NSManaged public var completeCount: Int16
    @NSManaged public var pickedUpTrashs: [String: Int]?
    @NSManaged public var finishCount: Int16
}
