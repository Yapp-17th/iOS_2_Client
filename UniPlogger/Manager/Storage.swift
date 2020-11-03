//
//  Storage.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/02.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation
import CoreData
enum StorageError: Error{
    case create(String)
    case read(String)
    case update(String)
    case delete(String)
}
class Storage{
    let context = CoreDataStore.shared.mainManagedObjectContext
}
