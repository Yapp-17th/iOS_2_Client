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
    
    var longPressClosure: (()->Void)?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(){
        self.image = UIImage(named: "ic_pinTrashCan")
        self.isDraggable = false
        self.isEnabled = false
        self.isUserInteractionEnabled = true
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        gesture.minimumPressDuration = 1.0
        self.addGestureRecognizer(gesture)
    }
    
    @objc func longPressed(){
        self.longPressClosure?()
    }
    
}

class TempTrashAnnotationView: MKAnnotationView{
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        configuration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(){
        self.image = UIImage(named: "ic_pinTrashCan")
        self.isDraggable = true
    }
    
}
