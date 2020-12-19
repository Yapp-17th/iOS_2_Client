//
//  TutorialNavigationController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/19.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class TutorialNavigationController: UINavigationController {
    let navView = UIView().then{
        $0.backgroundColor = .tabbarNavbar
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.layer.masksToBounds = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.view.addSubview(navView)
        navView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalTo(navigationBar)
            $0.top.equalToSuperview()
        }
        self.view.bringSubviewToFront(navigationBar)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.layer.masksToBounds = true
        
        navigationBar.tintColor = .text
    }
}
