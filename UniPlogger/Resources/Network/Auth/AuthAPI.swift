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
    typealias Response<T: Codable> = T
    
    let disposeBag = DisposeBag()
    
    static let shared = AuthAPI()
    private let provider = MoyaProvider<AuthAPITarget>(
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func login(email: String, password: String, completionHandler: @escaping (Result<LoginResponse, Error>) -> Void){
        provider.rx.request(.login(email: email, password: password))
            .filterSuccessfulStatusCodes()
            .map(LoginResponse.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func getUser(uid: Int, completionHandler: @escaping (Result<User, Error>) -> Void){
        provider.rx.request(.getUser(uid: uid))
            .filterSuccessfulStatusCodes()
            .map(User.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func registration(email: String, password1: String, password2: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        provider.rx.request(.registration(email: email, password1: password1, password2: password2))
            .filterSuccessfulStatusCodes()
            .map(LoginResponse.self)
            .subscribe {
                completion(.success($0))
            } onError: {
                completion(.failure($0))
            }.disposed(by: disposeBag)
    }
    
    func setNickname(uid: Int, nickname: String){
        provider.rx.request(.nickname(uid: uid, nickname: nickname))
            .filterSuccessfulStatusCodes()
            .subscribe().disposed(by: disposeBag)
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
    
}
