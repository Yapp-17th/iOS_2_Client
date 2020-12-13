//
//  ImagePreviewViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/13.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController, CameraDataStore {
    var router: ImagePreviewRouter?
    
    lazy var imageView = UIImageView().then {
        $0.image = capturedImage
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    lazy var nextButton = UIButton().then {
        $0.setImage(UIImage(named: "camera_next"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
    }
    lazy var dismissButtonView = UIView().then {
        $0.backgroundColor = .clear
        $0.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(touchUpDismissView))
        $0.addGestureRecognizer(gesture)
    }
    lazy var dismissImageView = UIImageView().then {
        $0.image = UIImage(named: "camera_dismiss")
    }
    lazy var dismissLabel = UILabel().then {
        $0.text = "촬영"
        $0.textColor = .white
        $0.font = .notoSans(ofSize: 17, weight: .regular)
    }
    var capturedImage: UIImage?
    var ploggingData: PloggingData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        setupLayout()
    }
    
    private func setup() {
        let viewController = self
        let router = ImagePreviewRouter()
        viewController.router = router
        router.viewController = viewController
        router.dataStore = viewController
    }
    
    @objc func touchUpNextButton() {
        router?.routeToShare()
    }
    
    @objc func touchUpDismissView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupViews() {
        self.view.backgroundColor = .black
        [imageView, nextButton, dismissButtonView, dismissLabel, dismissImageView].forEach {
            self.view.addSubview($0)
        }
    }
    
    func setupLayout() {
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.frame.height * 0.211)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.width)
        }
        nextButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-20)
            make.width.equalTo(136)
            make.height.equalTo(52)
            make.bottom.equalTo(-view.frame.height * 0.106)
        }
        dismissButtonView.snp.makeConstraints{ (make) in
            make.top.equalTo(44)
            make.leading.equalTo(9)
            make.width.equalTo(80)
            make.height.equalTo(44)
        }
        dismissImageView.snp.makeConstraints { (make) in
            make.leading.centerY.equalTo(dismissButtonView)
            make.width.equalTo(12)
            make.height.equalTo(21)
        }
        dismissLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(dismissImageView.snp.trailing).offset(5.05)
            make.centerY.equalTo(dismissButtonView)
        }
    }
}
