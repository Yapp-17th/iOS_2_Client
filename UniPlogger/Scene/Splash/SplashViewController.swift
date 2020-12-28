//
//  SplashViewController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Then

protocol SplashDisplayLogic: class {
    func displayLogined()
    func displayNotLogined()
    func displayError(error: Common.CommonError, useCase: Splash.UseCase)
}

class SplashViewController: UIViewController {
    var interactor: SplashBusinessLogic?
    var router: (NSObjectProtocol & SplashRoutingLogic & SplashDataPassing)?
    
    let splashImageView = UIImageView().then{
        $0.image = UIImage(named: "splashBackground")
        $0.contentMode = .scaleAspectFill
    }
    
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
        let viewController = self
        let interactor = SplashInteractor()
        let presenter = SplashPresenter()
        let router = SplashRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(splashImageView)
        splashImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        self.interactor?.setData()
        self.interactor?.setPushNotification()
    }
}

extension SplashViewController: SplashDisplayLogic{
    func displayLogined() {
        self.router?.routeToMain()
    }
    
    func displayNotLogined() {
        if !UserDefaults.standard.bool(forDefines: .hasTutorial) {
            self.router?.routeToTutorial()
        } else {
            self.router?.routeToLogin()
        }
        
    }
    
    func displayError(error: Common.CommonError, useCase: Splash.UseCase){
        //handle error with its usecase
    }
}
