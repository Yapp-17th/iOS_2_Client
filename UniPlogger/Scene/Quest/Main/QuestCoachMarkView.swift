//
//  QuestCoachMarkView.swift
//  UniPlogger
//
//  Created by woong on 2020/12/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestCoachMarkView: UIView {
    
    lazy var cancelButton = UIButton().then {
        $0.setImage(UIImage(named: "btn_ploggingCoachmarkClose"), for: .normal)
        $0.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    }
    
    private(set) var sproutBackgroundView = UIView().then {
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
    }
    
    private var sproutImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ic_todo_seed")
        $0.contentMode = .scaleToFill
    }
    
    lazy var coachMarkTableView = UITableView().then {
        $0.isUserInteractionEnabled = false
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.dataSource = self
        $0.delegate = self
        $0.register(QuestCoachDragCell.self, forCellReuseIdentifier: QuestCoachDragCell.identifier)
        $0.register(QuestCoachMarkCell.self, forCellReuseIdentifier: QuestCoachMarkCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        addSubview(cancelButton)
        addSubview(sproutBackgroundView)
        addSubview(coachMarkTableView)
        sproutBackgroundView.addSubview(sproutImageView)
    }
    
    func setupLayouts() {
        sproutImageView.snp.makeConstraints {
            $0.center.equalTo(sproutBackgroundView)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
    
    @objc func didTapCancelButton(_ sender: UIButton) {
        self.isHidden = true
    }
}

extension QuestCoachMarkView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 1,
           let cell = tableView.dequeueReusableCell(withIdentifier: QuestCoachDragCell.identifier, for: indexPath) as? QuestCoachDragCell {
            return cell
        } else if let cell = tableView.dequeueReusableCell(withIdentifier: QuestCoachMarkCell.identifier, for: indexPath) as? QuestCoachMarkCell {
            cell.configure(isGuide: indexPath.row == 0)
            return cell
        }
        
        
        return UITableViewCell()
    }
}

extension QuestCoachMarkView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let trainingHeight: CGFloat = 176 + 20
        let routineHeight: CGFloat = 88 + 20
        
        return indexPath.row == 0 ? trainingHeight : routineHeight
    }
}

