//
//  PloggingAPI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya
import RxSwift

final class PloggingAPI{
    typealias Response<T: Codable> = BaseResponse<T>
    
    let disposeBag = DisposeBag()
    
    static let shared = PloggingAPI()
    private let provider = MoyaProvider<PloggingAPITarget>(
        session: SessionManager.shared,
        plugins: [VerbosePlugin(verbose: true)]
    )
    
  func createTrashCan(latitude: Double, longitude: Double, address: String, completionHandler: @escaping (Result<BaseResponse<Bool>, Error>) -> Void){
    provider.rx.request(.createTrash(latitude: latitude, longitude: longitude, address: address))
          .filterSuccessfulStatusCodes()
          .map(BaseResponse<Bool>.self)
          .subscribe(onSuccess: {
            completionHandler(.success($0))
          }, onError: { completionHandler(.failure($0)) })
          .disposed(by: disposeBag)
    }
    
    func fetchTrashList(completionHandler: @escaping (Result<BaseResponse<[TrashCan]>, Error>)-> Void){
        provider.rx.request(.fetchTrashList)
          .filterSuccessfulStatusCodes()
          .map(BaseResponse<[TrashCan]>.self)
          .subscribe(onSuccess: {
            completionHandler(.success($0))
          }, onError: { completionHandler(.failure($0)) })
          .disposed(by: disposeBag)
    }
}
