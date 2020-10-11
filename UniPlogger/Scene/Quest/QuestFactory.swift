//
//  QuestFactory.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol QuestCellMaker {
    func cellBackgroundLayer(for state: Quest.Category) -> CAGradientLayer?
    func cellImage(for state: QuestState) -> UIImage?
    func accessoryImage(for state: QuestState) -> UIImage?
}

struct QuestFactory {
    
}

extension QuestFactory: QuestCellMaker {
    
    func cellBackgroundLayer(for state: Quest.Category) -> CAGradientLayer? {
        let layer = CAGradientLayer()
        switch state {
            case .training:
                layer.colors = [
                  UIColor(red: 0.975, green: 0.256, blue: 0.509, alpha: 1).cgColor,
                  UIColor(red: 0.924, green: 0.587, blue: 0.979, alpha: 1).cgColor
                ]
                layer.locations = [0, 1]
                layer.startPoint = CGPoint(x: 0.25, y: 0.5)
                layer.endPoint = CGPoint(x: 0.75, y: 0.5)
                layer.contents = UIImage(named: "space_background")?.cgImage
                layer.cornerRadius = 22
            case .routine:
                layer.colors = [
                    UIColor(red: 0.506, green: 0.769, blue: 0.945, alpha: 1).cgColor,
                    UIColor(red: 0.49, green: 0.635, blue: 0.953, alpha: 1).cgColor
                ]
                layer.locations = [0, 1]
                layer.startPoint = CGPoint(x: 0.25, y: 0.5)
                layer.endPoint = CGPoint(x: 0.75, y: 0.5)
                layer.contents = UIImage(named: "quest_routineBg")?.cgImage
                layer.cornerRadius = 22
        }
        
        return layer
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
            case .doing, .done: return UIImage(named: "delete_button")
            case .abandon: break
        }
        
        return nil
    }
}
