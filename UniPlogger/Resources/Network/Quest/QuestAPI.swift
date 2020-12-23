//
//  QuestAPI.swift
//  UniPlogger
//
//  Created by woong on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya
import RxSwift

final class QuestAPI {
    typealias Response<T: Codable> = BaseResponse<T>
    let disposeBag = DisposeBag()
    
    static let shared = QuestAPI()
    private let provider = MoyaProvider<QuestAPITarget>(
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func fetchQuestList(completionHandler: @escaping (Result<Response<[QuestResponse]>, Error>) -> Void) {
        provider.rx.request(.list)
            .filterSuccessfulStatusCodes()
            .map(Response<[QuestResponse]>.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }
            .disposed(by: disposeBag)
    }
    
    func detail(quest: Quest, completionHandler: @escaping(Result<Response<QuestResponse>, Error>) -> Void) {
        provider.rx.request(.detail(id: quest.id))
            .filterSuccessfulStatusCodes()
            .map(Response<QuestResponse>.self)
            .subscribe {
                completionHandler(.success($0))
            } onError: {
                completionHandler(.failure($0))
            }
            .disposed(by: disposeBag)
    }
    
    func start(quest: Quest, completionHandler: @escaping(Int) -> Void) {
        provider.rx.request(.start(id: quest.id))
            .filterSuccessfulStatusCodes()
            .subscribe {
                completionHandler($0.statusCode)
            } onError: {
                debugPrint($0)
            }
            .disposed(by: disposeBag)
    }
    
    func abandon(quest: Quest, completionHandler: @escaping(Int) -> Void) {
        provider.rx.request(.abandon(id: quest.id))
            .filterSuccessfulStatusCodes()
            .subscribe {
                completionHandler($0.statusCode)
            } onError: {
                debugPrint($0)
            }
            .disposed(by: disposeBag)
    }
    
    func delete(quest: Quest, completionHandler: @escaping(Int) -> Void) {
        provider.rx.request(.delete(id: quest.id))
            .filterSuccessfulStatusCodes()
            .subscribe {
                completionHandler($0.statusCode)
            } onError: {
                debugPrint($0)
            }
            .disposed(by: disposeBag)
    }
    
    func success(questId: Int, completionHandler: @escaping(Int) -> Void) {
        provider.rx.request(.success(id: questId))
            .filterSuccessfulStatusCodes()
            .subscribe {
                completionHandler($0.statusCode)
            } onError: {
                debugPrint($0)
            }
            .disposed(by: disposeBag)
    }
}
