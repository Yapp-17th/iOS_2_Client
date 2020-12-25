//
//  ChallengeInteractor.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/26.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ChallengeBusinessLogic {
    func setRank(members: [Player]) -> [Int]
    func setFullMembers(members: [Player]) -> [Player]
    func setDate() -> String
    func startChallenge()
    func getPlanet()
}

protocol ChallengeDataStore {
//    var playerId: [Int]? { get set }
}

class ChallengeInteractor: ChallengeBusinessLogic, ChallengeDataStore {
//    var playerData: [Challenge.RankCellViewModel]?
    var presenter: ChallengePresentationLogic?
    var worker = ChallengeWorker()
    
    let names = [["천", "송", "이", "이", "최", "손", "고"],
                 ["승", "윤", "주", "서", "철", "병", "세"],
                 ["연", "서", "형", "영", "웅", "근", "림"]]
    
    func setRank(members: [Player]) -> [Int] {
        var rankList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        var prevIndex = 9
        (0...8).reversed().forEach { (index) in
            if members[index].score == members[prevIndex].score {
                rankList[index] = rankList[prevIndex]
            }
            prevIndex = index
        }
        return rankList
    }
    
    func setTopImages(with rank: [Int]) -> [UIImage] {
        var baseImageList = [UIImage(named: "rank_first_small")!, UIImage(named: "rank_second_small")!, UIImage(named: "rank_third_small")!]
        let topRankList = [rank[0], rank[1], rank[2]]
        switch topRankList {
        case [1, 2, 3]:
            baseImageList[0] = UIImage(named: "rank_first_large")!
            baseImageList[1] = UIImage(named: "rank_second_medium")!
            return baseImageList
        case [2, 2, 3]:
            baseImageList[0] = UIImage(named: "rank_first_medium")!
            baseImageList[1] = UIImage(named: "rank_second_medium")!
            return baseImageList
        case [1, 3, 3]:
            baseImageList[0] = UIImage(named: "rank_first_large")!
            return baseImageList
        default:
            return baseImageList
        }
    }
    
    func setFullMembers(members: [Player]) -> [Player] {
        guard members.count != 10 else { return members }
        var newMembers = members
        while newMembers.count != 10 {
            let newUser = Player(id: -1, email: "temp@naver.com", nickname: getRandomName(), score: 0)
            newMembers.append(newUser)
        }
        return newMembers
    }
    
    func setDate() -> String {
        let calender = Calendar.current
        let month = calender.component(.month, from: Date())
        let week = calender.component(.weekOfMonth, from: Date())
        return "\(month)월 \(week)주차"
    }
    
    private func getRandomName() -> String {
        var name = ""
        for index in (0...2) { name += names[index][Int.random(in: (0...6))] }
        return name
    }
    
    func startChallenge() {
        if AuthManager.shared.user?.planet == nil {
            worker.startChallenge { (result) in
                print("result: \(result)")
            }
        }
    }

    func getPlanet() {
        worker.getPlanet { [weak self] (response) in
            guard let self = self else { return }
            print(response)
            let members = self.setFullMembers(members: response.players)
            let ranks = self.setRank(members: members)
            self.presenter?.presentPlayers(ranks: ranks, players: members)
        }
    }
    
}