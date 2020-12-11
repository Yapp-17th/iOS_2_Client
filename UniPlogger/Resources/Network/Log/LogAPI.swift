//
//  LogAPI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya
import RxSwift

final class LogAPI{
    typealias Response<T: Codable> = T
    
    let disposeBag = DisposeBag()
    
    static let shared = LogAPI()
    private let provider = MoyaProvider<LogAPITarget>(
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func getFeed(uid: Int, completionHandler: @escaping (Result<[Feed], Error>) -> Void){
        provider.rx.request(.getFeed(uId: uid))
            .filterSuccessfulStatusCodes()
            .map([Feed].self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: self.disposeBag)
    }
    
    func getUserFeed(uid: Int, completionHandler: @escaping (Result<[Feed], Error>) -> Void){
        provider.rx.request(.getUserFeed(uid: uid))
            .filterSuccessfulStatusCodes()
            .map([Feed].self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: self.disposeBag)
    }
    
    func getOtherUser(uid: Int, completionHandler: @escaping (Result<User, Error>) -> Void){
        provider.rx.request(.getOtherUser(uid: uid))
            .filterSuccessfulStatusCodes()
            .map(User.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func deleteFeed(fid: Int, completionHandler: @escaping (Result<Void, Error>) -> Void) {
        provider.rx.request(.deleteFeed(fid: fid))
            .filterSuccessfulStatusCodes()
            .subscribe { _ in
                completionHandler(.success(()))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: disposeBag)
    }
}
