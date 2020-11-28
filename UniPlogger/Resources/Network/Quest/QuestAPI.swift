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
    
    let disposeBag = DisposeBag()
    
    static let shared = QuestAPI()
    private let provider = MoyaProvider<QuestAPITarget>(
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
    func fetchQuestList(completionHandler: @escaping (Result<[Quest], Error>) -> Void) {
        provider.rx.request(.list)
            .filterSuccessfulStatusCodes()
            .map([QuestResponse].self)
            .subscribe { (responses) in
                completionHandler(.success(responses.map { $0.quest }))
            } onError: {
                completionHandler(.failure($0))
            }
            .disposed(by: disposeBag)
    }
    
    func detail(quest: Quest, completionHandler: @escaping(QuestResponse) -> Void) {
        provider.rx.request(.detail(id: quest.id))
            .filterSuccessfulStatusCodes()
            .map(QuestResponse.self)
            .subscribe {
                completionHandler($0)
            } onError: {
                debugPrint($0)
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
    
    func success(quest: Quest, completionHandler: @escaping(Int) -> Void) {
        provider.rx.request(.success(id: quest.id))
            .filterSuccessfulStatusCodes()
            .subscribe {
                completionHandler($0.statusCode)
            } onError: {
                debugPrint($0)
            }
            .disposed(by: disposeBag)
    }
}
