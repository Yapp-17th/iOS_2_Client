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
    typealias Response<T: Codable> = BaseResponse<T>
    
    let disposeBag = DisposeBag()
    
    static let shared = ChallengeAPI()
    
    private let provider = MoyaProvider<ChallengeAPITarget> (
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func startChallenge(completion: @escaping (Result<Response<Bool>, Error>) -> Void) {
        provider.rx.request(.startChallenge)
            .filterSuccessfulStatusCodes()
            .map(Response<Bool>.self)
            .subscribe(onSuccess: {
                completion(.success($0))
            }, onError: { completion(.failure($0)) })
            .disposed(by: disposeBag)

    }
    
    func fetchPlanet(completionHandler: @escaping (Result<Response<Planet?>, Error>)-> Void) {
        provider.rx.request(.fetchPlanet)
            .filterSuccessfulStatusCodes()
            .map(Response<Planet?>.self)
            .subscribe(onSuccess: {
                completionHandler(.success($0))
            }, onError: { completionHandler(.failure($0)) })
            .disposed(by: disposeBag)
    }
    
    func report(id: Int, completion: @escaping (Result<Response<Feed>, Error>) -> Void) {
        provider.rx.request(.report(id: id))
//            .filterSuccessfulStatusCodes()
            .map(Response<Feed>.self)
            .subscribe(onSuccess: {
                print("success")
                completion(.success($0))
            }, onError: {
                print("error")
                completion(.failure($0))
            })
            .disposed(by: disposeBag)
    }
    
}
