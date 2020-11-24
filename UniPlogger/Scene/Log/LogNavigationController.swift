//
//  LogNavigationController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/23.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
class LogNavigationController: UINavigationController {

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
        navigationBar.backgroundColor = Color.white.withAlphaComponent(0.6)
        navigationBar.barTintColor = Color.white.withAlphaComponent(0.6)
    }
}
