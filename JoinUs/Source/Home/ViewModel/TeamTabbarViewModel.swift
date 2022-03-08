//
//TeamTabbarViewModel.swift
//JoinUs
//
//CreatedbySeungMinon2021/10/06.
//

import Foundation

final class TeamTabbarViewModel{
    let teamList: [Team] = [
        Team("T1", "T1.jpg", .red),
        Team("젠지", "GenG.jpg", .brown),
        Team("담원기아", "DK.jpg", .systemGreen),
        Team("DRX", "DRX.jpg", .link),
        Team("광동", "Kwangdong.jpg", .orange),
        Team("프레딧", "Fredit.jpg", .systemGreen),
        Team("농심", "NS.jpg", .systemRed),
        Team("KT", "KT.jpg", .orange),
        Team("리브샌박", "Liiv.jpg", .systemYellow),
        Team("한화생명", "HLE.jpg", .orange),
    ]
    
    var countTeamList: Int{
        return teamList.count
    }
    
    func teamInfo(at index:Int) -> Team {
        return teamList[index]
    }
}
