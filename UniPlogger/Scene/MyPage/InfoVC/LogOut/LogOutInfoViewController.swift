//
//  LogOutViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class LogOutInfoViewController: InfoBaseViewController {

    lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(LogOutInfoTableViewCell.self, forCellReuseIdentifier: LogOutInfoTableViewCell.ID)
        $0.isScrollEnabled = false
        $0.allowsSelection = true
        $0.backgroundColor = .clear
        self.view.addSubview($0)
    }
    lazy var dimView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview($0)
        $0.backgroundColor = UIColor(named: "reportDimColor")
        $0.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.questBackground
        setupLayout()
    }
    
}

extension LogOutInfoViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LogOutType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LogOutInfoTableViewCell.ID) as? LogOutInfoTableViewCell else { return UITableViewCell() }
        cell.configure(item: LogOutType.allCases[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch LogOutType.allCases[indexPath.row] {
        case .logOut:
            dimView.isHidden = false 
            showAlert()
        case .withdraw:
            self.navigationController?.pushViewController(WIthdrawViewController(), animated: false)
        }
    }
    
    func showAlert() {
        let title = "아래 계정으로 다시 로그인 하실 수 있습니다."
        guard let message = AuthManager.shared.user?.email else { return }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        let confirmAction = UIAlertAction(title: "로그아웃", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.logOut()
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func logOut() {
        AuthAPI.shared.logout()
        AuthManager.shared.userToken = nil
        AuthManager.shared.user = nil
        AuthManager.shared.getPush = false
        AuthManager.shared.autoSave = false
        routeToSplash()
    }
    
    func routeToSplash() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.window?.rootViewController = SplashViewController()
            delegate.window?.makeKeyAndVisible()
        }
    }

}

extension LogOutInfoViewController {
    
    func setupLayout() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(98)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(104.5)
        }
        dimView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}
