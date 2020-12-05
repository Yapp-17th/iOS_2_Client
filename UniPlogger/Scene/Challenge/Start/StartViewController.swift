//
//  StartViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

import RxCocoa
import RxSwift

class StartViewController: UIViewController {
    var router: (NSObjectProtocol & StartRoutingLogic)?
    
    var disposeBag = DisposeBag()
    
    lazy var backgroundView = UIImageView().then {
        let image = UIImage(named: "startBackground")
        $0.image = image!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
        $0.clipsToBounds = true
    }
    lazy var spaceshipImageView = UIImageView().then {
        $0.image = UIImage(named: "spaceship")
    }
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "character")
    }
    lazy var startButton = UIButton().then{
        $0.setTitle("참여하기", for: .normal)
        $0.titleLabel?.font = .roboto(ofSize: 18, weight: .bold)
        $0.backgroundColor = UIColor(named: "rankColor")
        $0.layer.cornerRadius = 28
        $0.layer.masksToBounds = true
        $0.rx.tap
            .bind(onNext: touchUpStartButton)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
        setUpViews()
        setUpLayout()
        let interactor = ChallengeInteractor()
        interactor.startChallenge()
    }
    
    private func setup() {
        let viewController = self
        let router = StartRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    func touchUpStartButton() {
        router?.routeToChallenge()
    }

}

extension StartViewController {
    func configure() {

    }
    
    func setUpViews() {
        [backgroundView, spaceshipImageView, characterImageView, startButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        spaceshipImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.frame.height * 0.166)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(self.view.frame.width * 0.842)
            $0.height.equalTo(spaceshipImageView.snp.width).multipliedBy(1.633)
        }
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-self.view.frame.height * 0.147)
            $0.width.equalTo(self.view.frame.width * 0.894)
            $0.height.equalTo(startButton.snp.width).multipliedBy(0.167)
        }
        characterImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(startButton.snp.top).offset(-self.view.frame.height * 0.08)
            $0.width.equalTo(self.view.frame.width * 0.283)
            $0.height.equalTo(characterImageView.snp.width).multipliedBy(1.67)
        }
    }
}
