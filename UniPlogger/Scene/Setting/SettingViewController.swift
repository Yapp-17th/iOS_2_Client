//
//  SettingViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol SettingDisplayLogic: class {
  func displayGetUser(viewModel: Setting.GetUser.ViewModel)
  func displayError(error: Common.CommonError)
}

class SettingViewController: InfoBaseViewController {
  
  var pushAgree = false
  var interactor: SettingBusinessLogic?
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  func setup() {
    let viewController = self
    let interactor = SettingInteractor()
    let presenter = SettingPresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController
  }
  lazy var tableView = UITableView().then {
    $0.delegate = self
    $0.dataSource = self
    $0.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.ID)
    $0.isScrollEnabled = false
    $0.allowsSelection = false
    $0.backgroundColor = .clear
    $0.cellLayoutMarginsFollowReadableWidth = false
    $0.separatorInset.left = 0
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.questBackground
    setupLayout()
    self.interactor?.getUser()
  }
}

extension SettingViewController: SettingDisplayLogic {
  func displayGetUser(viewModel: Setting.GetUser.ViewModel) {
    self.pushAgree = viewModel.pushAgree
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
    
  }
  
  func displayError(error: Common.CommonError) {
    
  }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Setting.SettingType.allCases.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 52
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return settingCell(tableView, indexPath: indexPath)
  }
  
  func settingCell(_ tableView: UITableView, indexPath: IndexPath) -> SettingTableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell else { fatalError() }
    cell.contentView.isHidden = true
    cell.configure(item: Setting.SettingType.allCases[indexPath.row])
    if Setting.SettingType.allCases[indexPath.row] == .getPush{
      cell.switchButton.isOn = cell.switchButton.isOn && self.pushAgree
    }
    cell.switchClosure = { type, isOn in
      switch type {
      case .getPush:
        if isOn {
          PushManager.shard.getPushStatus { status in
            if status == .authorized {
              AuthManager.shared.getPush = isOn
              self.updateServerPushState(isOn: isOn)
            } else {
              DispatchQueue.main.async {
                let alert = UIAlertController(title: "알림", message: "기기 설정에서 푸시 알림을 허용 후 다시시도해주세요.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
                  guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                  cell.switchButton.isOn = false
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
                  
                }))
                self.present(alert, animated: true, completion: nil)
              }
              
            }
          }
        } else {
          AuthManager.shared.getPush = isOn
          self.updateServerPushState(isOn: isOn)
        }
        
      case .autosave:
        AuthManager.shared.autoSave = isOn
      }
    }
    return cell
  }
  
  func updateServerPushState(isOn: Bool){
    if self.pushAgree != isOn{
      self.interactor?.updatePush()
    }
  }
}

extension SettingViewController {
  
  func setupLayout() {
    tableView.snp.makeConstraints { (make) in
      make.top.equalTo(98)
      make.leading.equalTo(20)
      make.trailing.equalTo(-20)
      //            make.height.equalTo(104.5)
      make.height.equalTo(52 * Setting.SettingType.allCases.count)
    }
  }
  
}
