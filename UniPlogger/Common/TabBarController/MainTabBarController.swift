//
//  MainTabBarController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/27.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    private var shadowLayer: CAShapeLayer!
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
        self.tabBar.selectedImageTintColor = .tabBarTint
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
        
        let tabbarBackgroundView = RoundShadowView()
        tabbarBackgroundView.layer.cornerRadius = 22
        tabbarBackgroundView.backgroundColor = .tabBarBackground
        view.addSubview(tabbarBackgroundView)
      tabbarBackgroundView.snp.makeConstraints{
        $0.edges.equalTo(tabBar)
      }
        
        let fillerView = UIView()
        fillerView.frame = tabBar.frame
        fillerView.roundCorners(corners: [.topLeft, .topRight], radius: 22)
        fillerView.backgroundColor = .tabBarBackground
        view.addSubview(fillerView)
        
        view.bringSubviewToFront(tabBar)
    }
    
    private func updateView() {
        
    }
    
    func setupChallengeViewController(){
        let challengeItem = UITabBarItem(title: "챌린지", image: UIImage(named: "tabbar_challenge"), tag: 0)
        let vc = hasPlanet() ? UINavigationController(rootViewController: ChallengeViewController()) : StartViewController()
        vc.tabBarItem = challengeItem
        self.addChild(vc)
    }
    
    func setupQuestViewController(){
        let questItem = UITabBarItem(title: "퀘스트", image: UIImage(named: "tabbar_quest"), tag: 1)
        let questNavVC = UINavigationController()
        questNavVC.addChild(QuestViewController())
        let vc = questNavVC
        vc.tabBarItem = questItem
        self.addChild(vc)
    }
    
    func setupPloggingViewController(){
        let ploggingItem = UITabBarItem(title: "플로깅", image: UIImage(named: "tabbar_plogging"), tag: 2)
        let vc = PloggingViewController()
        vc.tabBarItem = ploggingItem
        self.addChild(vc)
    }
    
    func setupLogViewController(){
        let logItem = UITabBarItem(title: "로그", image: UIImage(named: "tabbar_log"), tag: 3)
        let vc = UIViewController()
        vc.tabBarItem = logItem
        self.addChild(vc)
    }
    
    func setupMyViewController(){
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
