//
//  TeamTabbarViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/06.
//

import Foundation

final class TeamTabbarViewModel {
    let team: [TeamModel] = [
        TeamModel(teamName: "담원 기아", teamImageName: "1.jpg"),
        TeamModel(teamName: "한화 생명", teamImageName: "2.jpg"),
        TeamModel(teamName: "T1", teamImageName: "3.jpg"),
        TeamModel(teamName: "젠지", teamImageName: "4.jpg"),
        TeamModel(teamName: "농심", teamImageName: "5.jpg"),
        TeamModel(teamName: "리브 샌박", teamImageName: "6.jpg"),
        TeamModel(teamName: "아프리카", teamImageName: "7.jpg"),
        TeamModel(teamName: "프레딧", teamImageName: "8.jpg"),
        TeamModel(teamName: "KT", teamImageName: "9.jpg"),
        TeamModel(teamName: "DRX", teamImageName: "10.jpg"),
    ]
    
    var countTeam: Int {
        return team.count
    }
    
    func teamInfo(at index: Int) -> TeamModel {
        return team[index]
    }
}
