//
//  InfoItemProtocol.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class InfoBaseViewController: UIViewController {
    
    var infoItem: InfoItemType = .signUpInfo
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = infoItem.description
    }
}
