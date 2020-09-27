//
//  BaseViewController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/27.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func didBecomeActive(){
        self.view.layoutSubviews()
    }
    
}
