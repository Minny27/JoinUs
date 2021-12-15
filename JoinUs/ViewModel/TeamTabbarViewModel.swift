//
//TeamTabbarViewModel.swift
//JoinUs
//
//CreatedbySeungMinon2021/10/06.
//

import Foundation

final class TeamTabbarViewModel{
    let teamList: [Team] = [
        Team("담원기아", "1.jpg"),
        Team("한화생명", "2.jpg"),
        Team("T1", "3.jpg"),
        Team("젠지", "4.jpg"),
        Team("농심", "5.jpg"),
        Team("리브샌박", "6.jpg"),
        Team("아프리카", "7.jpg"),
        Team("프레딧", "8.jpg"),
        Team("KT", "9.jpg"),
        Team("DRX", "10.jpg"),
    ]
    
    var countTeamList: Int{
        return teamList.count
    }
    
    func teamInfo(at index:Int) -> Team {
        return teamList[index]
    }
}
