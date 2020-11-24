//
//  MyPageViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    lazy var userInfoView = UIView().then {
        $0.backgroundColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
}
