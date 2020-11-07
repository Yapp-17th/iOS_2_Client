//
//  PloggingInfoView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

class PloggingInfoView: UIView {
    struct ViewModel{
        var distance: String
        var time: String
    }
    
    var viewModel: ViewModel?{
        didSet{
            updateView()
        }
    }
    
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "share_character")
    }
    lazy var ploggerImageView = UIImageView().then {
        $0.image = UIImage(named: "share_plogger")
    }
    lazy var timerImageView = UIImageView().then {
        $0.image = UIImage(named: "share_timer")
    }
    lazy var distanceLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "10.21km"
        $0.sizeToFit()
    }
    lazy var timeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "57:30"
        $0.sizeToFit()
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .black
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}

extension PloggingInfoView {
    func setUpView() {
        [characterImageView, ploggerImageView, timerImageView, distanceLabel, timeLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        characterImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
            $0.width.equalTo(80)
            $0.height.equalTo(87)
        }
        ploggerImageView.snp.makeConstraints {
            $0.leading.equalTo(characterImageView.snp.trailing).offset(42)
            $0.top.equalToSuperview().offset(76)
            $0.width.height.equalTo(26)
        }
        timerImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-55)
            $0.top.equalToSuperview().offset(76)
            $0.width.equalTo(22)
            $0.height.equalTo(25.67)
        }
        distanceLabel.snp.makeConstraints {
            $0.top.equalTo(ploggerImageView.snp.bottom).offset(2.38)
            $0.centerX.equalTo(ploggerImageView.snp.centerX)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(timerImageView.snp.bottom).offset(2.38)
            $0.centerX.equalTo(timerImageView.snp.centerX)
        }
    }
    
    func updateView(){
        guard let vm = self.viewModel else { return }
        self.distanceLabel.text = vm.distance
        self.timeLabel.text = vm.time
    }
}
