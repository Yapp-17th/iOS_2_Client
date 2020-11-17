//
//  UserLogViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class UserLogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationItem()
    }
    
    private func setNavigationItem() {
        let nickname = "nickname"
        navigationItem.title = "\(nickname) 로그"
        navigationController?.navigationBar.topItem?.title = "챌린지"
    }
  

}
