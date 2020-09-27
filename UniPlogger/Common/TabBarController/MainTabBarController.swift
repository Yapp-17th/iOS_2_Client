//
//  MainTabBarController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/27.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: View
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        setupView()
        setupLayout()
    }
}

extension MainTabBarController {
    private func configuration() {
        self.view.backgroundColor = .white
    }
    
    private func setupView() {
        // addSubview(view)
    }
    
    private func setupLayout() {
        self.tabBar.barTintColor = .white
        self.tabBar.layer.cornerRadius = 22
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func updateView() {
        
    }
}
