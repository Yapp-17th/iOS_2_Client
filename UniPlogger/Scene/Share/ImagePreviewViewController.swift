//
//  ImagePreviewViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/13.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {

    lazy var imageView = UIImageView().then {
        $0.image = self.capturedImage
        $0.clipsToBounds = true
    }
    lazy var nextButton = UIButton()
    
    var capturedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
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
    }
}
