//
//  StartCountingViewController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

class StartCountingViewController: UIViewController{
    var count = 3
    var timer: Timer?
    lazy var backgroundView = UIImageView().then {
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                // User Interface is Dark
                $0.image = UIImage(named: "countingDarkBackground")
            } else {
                // User Interface is Light
                $0.image = UIImage(named: "countingLightBackground")
            }
        } else {
            // Fallback on earlier versions
            $0.image = UIImage(named: "countingLightBackground")
        }
        
        $0.contentMode = .scaleAspectFill
    }
    
    let countLabel = UILabel().then{
        $0.text = "3"
        $0.font = .roboto(ofSize: 200, weight: .bold)
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = backgroundView
        
        backgroundView.addSubview(countLabel)
        countLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if(count > 1) {
            count -= 1
            countLabel.text = String(count)
        }else{
            
            self.dismiss(animated: true, completion: {
                self.timer?.invalidate()
                self.timer = nil
            })
        }
    }
}
