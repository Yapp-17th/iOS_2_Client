//
//  QuestTutorial1ViewController.swift
//  UniPlogger
//
//  Created by woong on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestTutorialViewController1: UIViewController {
    
    let backgroundImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
        $0.image = UIImage(named: "quest_tutorial1")
        $0.backgroundColor = .questBackground
    }
    
    let skipButton = HightlightButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Skip", for: .normal)
        $0.setTitleColor(.textBlack, for: .normal)
        $0.contentEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        $0.addTarget(self, action: #selector(didTapSkipButton(_:)), for: .touchUpInside)
    }
    
    lazy var nextButton = NextButtonView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.textBlack.cgColor
        $0.clipsToBounds = true
        $0.tapHandler = { [weak self] in
            self?.didTapNextButton()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        [skipButton, nextButton].forEach { backgroundImageView.addSubview($0) }
    }
    
    func setupLayouts() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        skipButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(20)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(134)
            $0.height.equalTo(52)
        }
    }
    
    @objc func didTapSkipButton(_ sender: HightlightButton) {
        UserDefaults.standard.setValue(false, forKey: "QuestTutorial")
        dismiss(animated: true, completion: nil)
    }
    
    func didTapNextButton() {
        let nextVC = QuestTutorialViewController2()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
