//
//  SettingModels.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

enum Setting{
  enum SettingType: Int, CaseIterable {
      case getPush
      case autosave
      
      var title: String {
          switch self {
          case .getPush:
              return "알림"
          case .autosave:
              return "사진자동저장"
          }
      }
      
  }
    enum GetUser {
        struct Response{
            var user: User?
            var error: Common.CommonError?
        }
        
        struct ViewModel{
            var pushAgree: Bool
        }
    }
}
