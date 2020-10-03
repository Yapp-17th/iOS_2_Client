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
    let someView = GradientView().then {
        $0.isHorizontal = false
        $0.colors = [.startCountBackground1,.startCountBackground2,.startCountBackground3]
        $0.locations = [0.0, 0.474, 1.0]
    }
    
    let countLabel = UILabel().then{
        $0.text = "3"
        $0.font = .roboto(ofSize: 200, weight: .bold)
        $0.textColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = someView
        
        someView.addSubview(countLabel)
        countLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        someView.setupGradients()
    }
    
    @objc func update() {
        if(count > 0) {
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
