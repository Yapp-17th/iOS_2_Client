//
//  TrashAnnotationView.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import MapKit
import SnapKit

class TrashAnnotationView: MKAnnotationView{
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    print("rect: \(rect)")
  }
  let containerView = UIView().then{
    $0.backgroundColor = .white
  }
  
  let contentsView = UIView().then{
    $0.backgroundColor = .yellow
  }
  
  override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
    super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    self.image = UIImage(named: "temp_pin")
    self.isDraggable = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
