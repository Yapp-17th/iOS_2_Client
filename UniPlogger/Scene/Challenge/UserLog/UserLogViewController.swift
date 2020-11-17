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
