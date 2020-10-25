//
//  QuestNavigationController.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestNavigationController: UINavigationController {

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
        view.backgroundColor = Color.questBackgroundTint
    }
}
