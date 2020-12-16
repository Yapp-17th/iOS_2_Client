//
//  IntrinsicSizeCollectionView.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/07.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class IntrinsicSizeCollectionView: UICollectionView {
    var observer: NSKeyValueObservation?
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isScrollEnabled = false
        let handler = { (collectionView: UICollectionView, change: NSKeyValueObservedChange<CGSize>) in
            if let contentSize = change.newValue {
                print(contentSize)
                self.invalidateIntrinsicContentSize()
            }
        }
        observer = self.observe(\.contentSize, options: [NSKeyValueObservingOptions.new], changeHandler: handler)
    }
    
    override var intrinsicContentSize: CGSize {
        let size = self.collectionViewLayout.collectionViewContentSize
        return .init(width: max(size.width, 1), height: max(size.height, 1))
    }
    
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
}
