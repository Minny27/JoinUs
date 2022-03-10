//
//TeamTabbarViewModel.swift
//JoinUs
//
//CreatedbySeungMinon2021/10/06.
//

import Foundation

final class TeamTabbarViewModel{
    let teamList: [Team] = [
        Team("T1", "T1", .red),
        Team("젠지", "GenG", .brown),
        Team("담원기아", "DK", .systemGreen),
        Team("DRX", "DRX", .link),
        Team("광동", "Kwangdong", .orange),
        Team("프레딧", "Fredit", .systemGreen),
        Team("농심", "NS", .systemRed),
        Team("KT", "KT", .orange),
        Team("리브샌박", "Liiv", .systemYellow),
        Team("한화생명", "HLE", .orange),
    ]
    
    var countTeamList: Int{
        return teamList.count
    }
    
    func teamInfo(at index:Int) -> Team {
        return teamList[index]
    }
}
