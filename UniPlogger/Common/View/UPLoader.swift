//
//  UPLoader.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class UPLoader: UIView {
    static let shared = UPLoader()
    
    let images: [UIImage] = [
        UIImage(named: "ic_loading001")!,
        UIImage(named: "ic_loading002")!,
        UIImage(named: "ic_loading003")!,
        UIImage(named: "ic_loading004")!,
        UIImage(named: "ic_loading005")!,
        UIImage(named: "ic_loading006")!
    ]
    
    let timeInterval: TimeInterval = 10
    var currentTime: TimeInterval = 10
    var timer: Timer?
    
    var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    lazy var container: UIView = {
        let container = UIView(frame: UIScreen.main.bounds)
        container.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        container.isUserInteractionEnabled = true
        return container
    }()
    
    lazy var loadingView: UIView = {
        var loadingView: UIView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 90)
        loadingView.backgroundColor = .clear
        loadingView.clipsToBounds = true
        //loadingView.layer.cornerRadius = 10
        return loadingView
    }()
    
    func show() {
        self.addSubview(container)
        container.addSubview(loadingView)
        loadingView.center = container.center
        loadingView.layer.shadowColor = UIColor.black.cgColor
        loadingView.layer.shadowOpacity = 0.05
        loadingView.layer.shadowOffset = CGSize(width: 0, height: 3)
        loadingView.layer.shadowRadius = 3
        
        
        let imageView = UIImageView()
        imageView.animationImages = images
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        imageView.clipsToBounds = true
        loadingView.addSubview(imageView)
        
        
        /*loadingView.center = container.center
         loadingView.addSubview(activityIndicator)
         activityIndicator.frame = loadingView.bounds
         activityIndicator.startAnimating()*/
        timerStart()
        imageView.animationDuration = 3
        imageView.startAnimating()
        UIApplication.shared.keyWindow?.addSubview(container)
        
    }
    
    func hidden(delay: Double = 0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.2, delay: delay, options: .curveEaseInOut, animations: {
            //self.activityIndicator.startAnimating()
            self.container.removeFromSuperview()
        }, completion: completion)
    }
    
    func timerStart() {
        if timer != nil {
            timer = nil
            currentTime = timeInterval
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] timer in
            self?.currentTime -= 1
            
            if self?.timeInterval == 0 {
                self?.timerStop()
                self?.hidden()
            }
        })
    }
    
    func timerStop() {
        timer?.invalidate()
        currentTime = timeInterval
    }
}
