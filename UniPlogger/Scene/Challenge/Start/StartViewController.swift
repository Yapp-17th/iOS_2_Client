//
//  StartViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var router: (NSObjectProtocol & ChallengeRoutingLogic & ChallengeDataPassing)?
    
    lazy var backgroundView = UIImageView().then {
        let image = UIImage(named: "startBackground")
        $0.image = image!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
        $0.clipsToBounds = true

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
        $0.addTarget(self, action: #selector(touchUpStartButton), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUpViews()
        setUpLayout()
    }
    
    private func setup() {
        let viewController = self
        let router = ChallengeRouter()
        viewController.router = router
    }
    
    @objc func touchUpStartButton() {
        
    }

}

extension StartViewController {
    func setUpViews() {
        [backgroundView, characterImageView, startButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        backgroundView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        startButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-self.view.frame.height * 0.147)
            $0.width.equalTo(self.view.frame.width * 0.894)
            $0.height.equalTo(startButton.snp.width).multipliedBy(0.167)
        }
        characterImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.frame.height * 0.484 - 10)
//            $0.bottom.equalTo(startButton.snp.top).offset(-self.view.frame.height * 0.08)
            $0.width.equalTo(self.view.frame.width * 0.283)
            $0.height.equalTo(characterImageView.snp.width).multipliedBy(1.67)
        }
    }
}

extension UIImage {
    func resizeTopAlignedToFill(newWidth: CGFloat) -> UIImage? {
        let newHeight = size.height * newWidth / size.width
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
