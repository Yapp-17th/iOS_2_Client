//
//  IntrinsicSizeCollectionView.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/07.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class IntrinsicSizeCollectionView: UICollectionView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
      self.invalidateIntrinsicContentSize()
    }
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
