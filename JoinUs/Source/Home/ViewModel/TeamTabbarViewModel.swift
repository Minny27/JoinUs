//
//TeamTabbarViewModel.swift
//JoinUs
//
//CreatedbySeungMinon2021/10/06.
//

import Foundation

final class TeamTabbarViewModel{
    let teamList: [Team] = [
        Team("담원기아", "DK.jpg", .systemGreen),
        Team("한화생명", "HLE.jpg", .orange),
        Team("T1", "T1.jpg", .red),
        Team("젠지", "GenG.jpg", .brown),
        Team("농심", "NS.jpg", .systemRed),
        Team("리브샌박", "Liiv.jpg", .systemYellow),
        Team("아프리카", "Afreeca.jpg", .systemTeal),
        Team("프레딧", "Fredit.jpg", .systemGreen),
        Team("KT", "KT.jpg", .orange),
        Team("DRX", "DRX.jpg", .link),
    ]
    
    var countTeamList: Int{
        return teamList.count
    }
    
    func teamInfo(at index:Int) -> Team {
        return teamList[index]
    }
}
