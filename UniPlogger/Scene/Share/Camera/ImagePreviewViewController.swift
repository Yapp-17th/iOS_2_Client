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
    
    var capturedImage: UIImage?
    var ploggingData: PloggingData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.backItem?.title = "촬영"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
    
    func setupViews() {
        self.view.backgroundColor = .black
        [imageView, nextButton].forEach {
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
    }
}
