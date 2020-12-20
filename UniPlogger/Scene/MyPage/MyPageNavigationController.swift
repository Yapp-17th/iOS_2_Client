//
//  MyPageNavigationController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MyPageNavigationController: UINavigationController {
    lazy var navigationView = UIView().then {
        $0.backgroundColor = UIColor(named: "navigationBarColor")
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        self.view.addSubview(navigationView)
        navigationView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalTo(self.navigationBar)
        }
        self.view.bringSubviewToFront(navigationBar)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        navigationBar.layer.masksToBounds = true
        navigationBar.layer.cornerRadius = 30
        navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        navigationBar.tintColor = .text
        
    }

}
