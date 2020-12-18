//
//  NetworkerrorManager.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/04.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class NetworkErrorManager{
    class func alert(_ error: URLError, completion: ((UIAlertAction) -> Void)?) {
        let viewController = UIApplication.topViewController()
        switch error.code {
        case .notConnectedToInternet:
            let alert = UIAlertController(title: "네트워크 오류", message: "네트워크 연결이 불안정합니다. 잠시 후 다시 시도해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "다시 시도", style: .default, handler: completion))
            alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            viewController?.present(alert, animated: true, completion: nil)
        case .timedOut:
            let alert = UIAlertController(title: "네트워크 오류", message: "서버와 연결할 수 없습니다. 잠시 후 다시 시도해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "다시 시도", style: .default, handler: completion))
            alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            viewController?.present(alert, animated: true, completion: nil)
        default:
            let alert = UIAlertController(title: "네트워크 오류", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            viewController?.present(alert, animated: true, completion: nil)
        }
    }
}
