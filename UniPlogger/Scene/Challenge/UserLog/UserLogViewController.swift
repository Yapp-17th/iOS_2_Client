//
//  UserLogViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class UserLogViewController: UIViewController {
    var router:  (NSObjectProtocol & UserLogRoutingLogic)?
    
    lazy var backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "bg_logPloggerContainer")?.withRenderingMode(.alwaysOriginal)
    }
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "character")
    }
    lazy var leftStarImageView = UIImageView().then {
        $0.image = UIImage(named: "star_yellow")
    }
    lazy var rightStarImageView = UIImageView().then {
        $0.image = UIImage(named: "star_pink")
    }
    lazy var levelTitleLabel = UILabel().then {
        $0.text = "레벨"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 14, weight: .regular)
    }
    lazy var rankTitleLabel = UILabel().then {
        $0.text = "상위"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 14, weight: .regular)
    }
    lazy var levelLabel = UILabel().then {
        $0.text = "2"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 20, weight: .bold)
    }
    lazy var rankLabel = UILabel().then {
        $0.text = "5%"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 20, weight: .bold)
    }
    
    lazy var nextButton = UIButton().then {
        $0.setTitle("next", for: .normal)
        $0.backgroundColor = .lightGray
        $0.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationItem()
        configure()
        setUpViews()
        setUpLayout()
    }
    
    private func configure() {
        let viewController = self
        let router = UserLogRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    private func setNavigationItem() {
        let nickname = "nickname"
        navigationItem.title = "\(nickname) 로그"
        navigationController?.navigationBar.topItem?.title = "챌린지"
    }
  
    @objc func touchUpNextButton() {
        router?.routeToDetail()
    }

}
