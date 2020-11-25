//
//  MyPageNavigationController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MyPageNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationBar.clipsToBounds = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.layer.cornerRadius = 30
        navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        navigationBar.tintColor = Color.textBlack
        navigationBar.backgroundColor = Color.questBackgroundTint
        navigationBar.barTintColor = Color.questBackgroundTint
    }

}
