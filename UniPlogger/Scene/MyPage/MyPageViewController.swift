//
//  MyPageViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    lazy var userInfoView = UserInfoView().then {
        $0.backgroundColor = .black
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
        setupViews()
        setupLayout()
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
    }
    
}
