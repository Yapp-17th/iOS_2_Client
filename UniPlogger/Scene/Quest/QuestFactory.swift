//
//  QuestFactory.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol QuestCellMakable {
    func cellBackgroundColor(for state: Quest.Category) -> String
    func cellImage(for state: QuestState) -> UIImage?
    func cellImageBackgroundColor(for state: Quest.Category) -> UIColor
    func accessoryImage(for state: QuestState) -> UIImage?
}

struct QuestFactory {
    
}

extension QuestFactory: QuestCellMakable {
    
    func cellBackgroundColor(for state: Quest.Category) -> String {
        switch state {
            case .training, .routine:
                return "questBackgroundTint"
        }
    }
    
    func cellImageBackgroundColor(for state: Quest.Category) -> UIColor {
        switch state {
            case .training:
                return .trainingTint
            case .routine:
                return .routineTint
        }
    }
    
    func cellImage(for state: QuestState) -> UIImage? {
        switch state {
            case .todo: return UIImage(named: "ic_todo_seed")
            case .doing: return UIImage(named: "ic_doing_seed")
            case .done: return UIImage(named: "ic_done_seed")
            case .abandon: break
        }
        
        return nil
    }
    
    func accessoryImage(for state: QuestState) -> UIImage? {
        switch state {
            case .todo: return UIImage(named: "add_button")
            case .doing: return UIImage(named: "cancel_button")
            case .done: return UIImage(named: "delete_button")
            case .abandon: break
        }
        
        return nil
    }
}
