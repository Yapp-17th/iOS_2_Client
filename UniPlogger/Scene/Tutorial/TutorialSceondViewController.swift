//
//  TutorialSceondViewController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

class TutorialSecondViewController: UIViewController {
    lazy var backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "bg_tutorialSecond")!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
    }
    
    lazy var skipButton = UIButton().then {
        $0.setTitle("SKIP", for: .normal)
        $0.titleLabel?.font = .roboto(ofSize: 15, weight: .bold)
        $0.setTitleColor(.init(hexString: "#999999"), for: .normal)
        $0.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    
    let contentLabel = UILabel().then {
        $0.text = """
        회의에서는 다름 아닌,
        MVP 우주 청소부,
        ‘플로거짱'을 선정하여

        인생에 다신 없을 명예와
        아직 오염되지 않은
        소행성 ‘zmffls’을
        부상으로 준다고 한다!
        """
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = .dynamicNotosans(fontSize: 20, weight: .bold)
    }
    
    let nextButtonView = UIView().then{
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 26
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(red: 196, green: 196, blue: 196).cgColor
    }
    
    let nextLabel = UILabel().then{
        $0.text = "NEXT"
        $0.textColor = .white
        $0.font = .roboto(ofSize: 15, weight: .bold)
    }
    
    let nextImageView = UIImageView().then{
        $0.contentMode = .center
        $0.image = UIImage(named: "ic_BtnNextRight")
    }
    
    lazy var nextButton = UIButton().then {
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(skipButton)
        self.view.addSubview(nextButtonView)
        self.view.addSubview(contentLabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
        }
        skipButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(28)
            $0.trailing.equalTo(-20)
        }
        
        contentLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(64)
        }
        
        nextButtonView.addSubview(nextLabel)
        nextButtonView.addSubview(nextImageView)
        nextButtonView.addSubview(nextButton)
        
        nextButtonView.snp.makeConstraints{
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            $0.trailing.equalTo(-32)
            $0.width.equalTo(134)
            $0.height.equalTo(52)
        }
        
        nextImageView.snp.makeConstraints{
            $0.trailing.equalTo(-30)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        nextLabel.snp.makeConstraints{
            $0.trailing.equalTo(nextImageView.snp.leading).offset(-8)
            $0.centerY.equalToSuperview().offset(0.5)
        }
        
        nextButton.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    @objc func skipButtonTapped() {
        UserDefaults.standard.set(true, forDefines: .hasTutorial)
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func nextButtonTapped() {
        self.navigationController?.pushViewController(TutorialThirdViewController(), animated: true)
    }
}

