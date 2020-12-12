//
//  AuthAPI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya
import RxSwift
final class AuthAPI{
    typealias Response<T: Codable> = BaseResponse<T>
    
    let disposeBag = DisposeBag()
    
    static let shared = AuthAPI()
    private let provider = MoyaProvider<AuthAPITarget>(
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func login(email: String, password: String, completionHandler: @escaping (Result<Response<LoginResponse>, Error>) -> Void){
        provider.rx.request(.login(email: email, password: password))
            .filterSuccessfulStatusCodes()
            .map(Response<LoginResponse>.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func getUser(uid: Int, completionHandler: @escaping (Result<Response<User>, Error>) -> Void){
        provider.rx.request(.getUser(uid: uid))
            .filterSuccessfulStatusCodes()
            .map(Response<User>.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func registration(email: String, password1: String, password2: String, nickname: String, completion: @escaping (Result<Response<LoginResponse>, Error>) -> Void) {
        provider.rx.request(.registration(email: email, password1: password1, password2: password2, nickname: nickname))
            .filterSuccessfulStatusCodes()
            .map(Response<LoginResponse>.self)
            .subscribe {
                completion(.success($0))
            } onError: {
                completion(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func initQuest(){
        provider.rx.request(.initQuest)
            .filterSuccessfulStatusCodes()
            .subscribe().disposed(by: disposeBag)
    }
    
    func logout() {
        provider.rx.request(.logout)
            .filterSuccessfulStatusCodes()
            .subscribe { (data) in
                print(data)
            } onError: { (error) in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)

    }
    
    func withdraw(uid: Int) {
        provider.rx.request(.withdraw(uid: uid))
            .filterSuccessfulStatusCodes()
            .subscribe { (data) in
                print(data)
            } onError: { (error) in
                print(error.localizedDescription)
            }.disposed(by: disposeBag)
    }
    
    func findPassword(email: String, completion: @escaping (Result<Response<FindPasswordResponse>, Error>) -> Void) {
        provider.rx.request(.findPassword(email: email))
            .filterSuccessfulStatusCodes()
            .map (Response<FindPasswordResponse>.self)
            .subscribe {
                completion(.success($0))
            } onError: {
                completion(.failure($0))
            }.disposed(by: disposeBag)
    }
    
}
