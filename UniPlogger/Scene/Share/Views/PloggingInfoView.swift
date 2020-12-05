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
        var feed: Feed?
        var distance: String
        var time: String
    }
    
    var viewModel: ViewModel?{
        didSet{
            updateView()
        }
    }
    
    lazy var gradientView = GradientView().then {
        $0.colors = [.clear, .black]
        $0.locations = [0.02, 1]
    }
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "share_character")
    }
    lazy var leftView = UIView()
    lazy var ploggerImageView = UIImageView().then {
        $0.image = UIImage(named: "share_plogger")
    }
    lazy var rightView = UIView()
    lazy var timerImageView = UIImageView().then {
        $0.image = UIImage(named: "share_timer")
    }
    lazy var distanceLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "10.21 km"
        $0.font = .roboto(ofSize: 20, weight: .bold)
        $0.sizeToFit()
    }
    lazy var timeLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .white
        $0.text = "57 : 30"
        $0.font = .roboto(ofSize: 20, weight: .bold)
        $0.sizeToFit()
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
}

extension PloggingInfoView {
    func setUpView() {
        [gradientView, characterImageView, leftView, rightView, ploggerImageView, timerImageView, distanceLabel, timeLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        gradientView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        characterImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(87)
        }
        leftView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalTo(characterImageView.snp.leading)
            $0.top.equalToSuperview().offset(76)
        }
        rightView.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview()
            $0.leading.equalTo(characterImageView.snp.trailing)
            $0.top.equalTo(leftView)
        }
        ploggerImageView.snp.makeConstraints {
            $0.top.centerX.equalTo(leftView)
//            $0.leading.equalTo(characterImageView.snp.trailing).offset(42)
//            $0.top.equalToSuperview().offset(76)
            $0.width.height.equalTo(26)
        }
        timerImageView.snp.makeConstraints {
            $0.top.centerX.equalTo(rightView)
//            $0.trailing.equalToSuperview().offset(-55)
//            $0.top.equalToSuperview().offset(76)
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
        
        if let feed = vm.feed{
            self.distanceLabel.text = "\(feed.distance)"
            self.timeLabel.text = "\(feed.time)"
        }
    }
}
