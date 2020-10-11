//
//  QuestFactory.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol QuestCellMaker {
    func cellImage(for state: QuestState) -> UIImage?
    func accessoryImage(for state: QuestState) -> UIImage?
}

struct QuestFactory {
    
}

extension QuestFactory: QuestCellMaker {
    func cellImage(for state: QuestState) -> UIImage? {
        switch state {
            case .todo: return UIImage(named: "sprout")
            case .doing: return UIImage(named: "sprout")
            case .done: return UIImage(named: "sprout")
            case .abandon: break
        }
        
        return nil
    }
    
    func accessoryImage(for state: QuestState) -> UIImage? {
        switch state {
            case .todo: return UIImage(named: "delete_button")
            case .doing: return UIImage(named: "delete_button")
            case .done: return UIImage(named: "delete_button")
            case .abandon: break
        }
        
        return nil
    }
}
