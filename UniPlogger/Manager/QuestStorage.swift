//
//  QuestStorage.swift
//  UniPlogger
//
//  Created by woong on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation
import CoreData

protocol QuestStorageType {
    func createProceedingQuest(for quest: Quest, completion: @escaping (Result<ProceedingQuest, Error>) -> Void)
    func fetchProceedingQuestList(completion: @escaping (Result<[ProceedingQuest], Error>) -> Void)
    func updateProceedingQuest(_ proceedingQuest: ProceedingQuest)
    func deleteProceedingQuest(_ proceedingQuest: ProceedingQuest, completion: @escaping (Result<Void, Error>) -> Void)
}

extension Storage: QuestStorageType {
    func createProceedingQuest(for quest: Quest, completion: @escaping (Result<ProceedingQuest, Error>) -> Void) {
        context.perform {
            let proceedingQuest = ProceedingQuest(context: self.context)
            proceedingQuest.questId = Int16(quest.id)
            proceedingQuest.email = AuthManager.shared.user?.email ?? ""
            do {
                try self.context.save()
                completion(.success(proceedingQuest))
            } catch let error{
                completion(.failure(StorageError.create(error.localizedDescription)))
            }
        }
    }
    
    func fetchProceedingQuestList(completion: @escaping (Result<[ProceedingQuest], Error>) -> Void) {
        context.perform {
            let fetchRequest = NSFetchRequest<ProceedingQuest>(entityName: "ProceedingQuest")
            fetchRequest.predicate = NSPredicate(format: "(email == %@)", AuthManager.shared.user?.email ?? "")
            do {
                let proceedingQuestList = try self.context.fetch(fetchRequest)
                completion(.success(proceedingQuestList))
            } catch let error {
                completion(.failure(StorageError.read(error.localizedDescription)))
            }
        }
    }
    
    func updateProceedingQuest(_ proceedingQuest: ProceedingQuest) {
        do {
            try self.context.save()
        } catch let error {
            #if DEBUG
            print(error)
            #endif
        }
    }
    
    func deleteProceedingQuest(_ proceedingQuest: ProceedingQuest, completion: @escaping (Result<Void, Error>) -> Void) {
        context.perform {
            self.context.delete(proceedingQuest)
            do {
                try self.context.save()
                completion(.success(()))
            } catch let error {
                completion(.failure(error))
            }
        }
    }
}
