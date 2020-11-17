//
//  DetailViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var backgroundImageView = UIImageView().then {
        let image = UIImage(named: "mainBackground")
        $0.image = image!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
        $0.clipsToBounds = true
    }
    lazy var ploggingImageView = PloggingImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
    }
    lazy var reportButton = UIBarButtonItem(image: UIImage(named: "report"), style: .plain, target: self, action: #selector(touchUpReportButton))

    // MARK: Object lifecycle
      
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationItem()
        setUpViews()
        setUpLayout()
    }

    private func setNavigationItem() {
        let date = "20.10.17"
        navigationItem.title = "\(date)"
        navigationController?.navigationBar.backItem?.title = "로그"
        self.navigationItem.rightBarButtonItem = reportButton
    }
    
    @objc func touchUpReportButton() {
        print("report")
    }
}
