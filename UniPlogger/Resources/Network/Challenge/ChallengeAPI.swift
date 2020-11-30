//
//  ChallengeAPI.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

import Moya
import RxSwift

class ChallengeAPI {
    typealias Response<T: Codable> = T
    
    let disposeBag = DisposeBag()
    
    static let shared = ChallengeAPI()
    
    private let provider = MoyaProvider<ChallengeAPITarget> (
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func startChallenge(completion: @escaping (Result<Bool, Error>) -> Void) {
        provider.rx.request(.startChallenge)
            .filterSuccessfulStatusCodes()
            .map(Bool.self)
            .subscribe(onSuccess: {
                completion(.success($0))
            }, onError: { completion(.failure($0)) })
            .disposed(by: disposeBag)

    }
    
    func fetchPlanet(completionHandler: @escaping (Result<Planet?, Error>)-> Void) {
        provider.rx.request(.fetchPlanet)
            .filterSuccessfulStatusCodes()
            .map(Planet?.self)
            .subscribe(onSuccess: {
                completionHandler(.success($0))
            }, onError: { completionHandler(.failure($0)) })
            .disposed(by: disposeBag)
    }
    
}
