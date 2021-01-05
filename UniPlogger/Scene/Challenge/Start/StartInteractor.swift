//
//  StartInteractor.swift
//  UniPlogger
//
//  Created by 고세림 on 2021/01/05.
//  Copyright © 2021 손병근. All rights reserved.
//

import Foundation

protocol StartBusinessLogic {
    func startChallenge(completion: @escaping (Bool) -> Void)
    func getPlanet(completion: @escaping (Planet) -> Void)
}

protocol StartDataStore {
    var planet: Planet? { get set }
}

class StartInteractor: StartBusinessLogic, StartDataStore {
    var planet: Planet?
    var worker = StartWorker()
    
    func startChallenge(completion: @escaping (Bool) -> Void) {
        worker.startChallenge() { result in
            completion(result)
        }
    }
    
    func getPlanet(completion: @escaping (Planet) -> Void) {
        worker.getPlanet { (planet) in
            completion(planet)
        }
    }
    
}
