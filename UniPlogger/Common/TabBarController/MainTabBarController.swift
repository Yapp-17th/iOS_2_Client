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
        self.tabBar.barTintColor = .tabBarBackground
        self.tabBar.tintColor = .tabBarTint
        self.tabBar.unselectedItemTintColor = .tabBarUnselectedTint
    }
    
    private func setupView() {
        setupChallengeViewController()
        setupQuestViewController()
        setupPloggingViewController()
        setupLogViewController()
        setupMyViewController()
        
        self.selectedIndex = 2
    }
    
    private func setupLayout() {
        tabBar.backgroundImage = UIImage.from(color: .clear)
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .tabBarBackground
        tabBar.layer.cornerRadius = 22
        
        let tabbarBackgroundView = RoundShadowView()
        tabbarBackgroundView.layer.cornerRadius = 22
        tabbarBackgroundView.backgroundColor = .tabBarBackground
        tabbarBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.insertSubview(tabbarBackgroundView, at: 0)
        tabbarBackgroundView.snp.makeConstraints{
            $0.edges.equalTo(tabBar)
        }
    }
    
    private func updateView() {
        
    }
    
    private func setupChallengeViewController(){
        let challengeItem = UITabBarItem(title: "챌린지", image: UIImage(named: "tabbar_challenge"), tag: 0)
        let vc = hasPlanet() ? UINavigationController(rootViewController: ChallengeViewController()) : StartViewController()
        vc.tabBarItem = challengeItem
        self.addChild(vc)
    }
    
    private func setupQuestViewController(){
        let questItem = UITabBarItem(title: "퀘스트", image: UIImage(named: "tabbar_quest"), tag: 1)
        let questNavVC = QuestNavigationController()
        questNavVC.addChild(QuestViewController())
        let vc = questNavVC
        vc.tabBarItem = questItem
        self.addChild(vc)
    }
    
    private func setupPloggingViewController(){
        let ploggingItem = UITabBarItem(title: "플로깅", image: UIImage(named: "tabbar_plogging"), tag: 2)
        let vc = PloggingViewController()
        vc.tabBarItem = ploggingItem
        self.addChild(vc)
    }
    
    private func setupLogViewController(){
        let logItem = UITabBarItem(title: "로그", image: UIImage(named: "tabbar_log"), tag: 3)
        let vc = LogViewController()
        vc.tabBarItem = logItem
        self.addChild(vc)
    }
    
    private func setupMyViewController(){
        let myItem = UITabBarItem(title: "마이", image: UIImage(named: "tabbar_my"), tag: 4)
        let vc = UIViewController()
        vc.tabBarItem = myItem
        self.addChild(vc)
    }
    
    private func hasPlanet() -> Bool {
        // user의 planet이 nil이면 return false 
        return false
    }
}
