//
//  MyPageViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    var router: (NSObjectProtocol & MyPageRoutingLogic)?
    
    lazy var backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "mypage_background")?.withRenderingMode(.alwaysOriginal)
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
    lazy var infoView = UIView().then {
        $0.backgroundColor = .clear
    }
    lazy var itemTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false 
        $0.dataSource = self
        $0.delegate = self
        $0.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.ID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.questBackground
        setNavigationItem()
        setUpViews()
        setUpLayout()
        configure()
    }
    
    private func setNavigationItem() {
        navigationItem.title = "마이페이지"
    }
    
    private func configure() {
        let viewController = self
        let router = MyPageRouter()
        viewController.router = router
        router.viewController = viewController
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InfoItemType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.ID) as? InfoTableViewCell else { return UITableViewCell() }
        cell.configure(item: InfoItemType.allCases[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToNextVC(infoItem: InfoItemType(rawValue: indexPath.row) ?? .signUpInfo)
    }
    
}
