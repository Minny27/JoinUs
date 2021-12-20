//
//TeamTabbarViewModel.swift
//JoinUs
//
//CreatedbySeungMinon2021/10/06.
//

import Foundation

final class TeamTabbarViewModel{
    let teamList: [Team] = [
        Team("담원기아", "DK.jpg"),
        Team("한화생명", "HLE.jpg"),
        Team("T1", "T1.jpg"),
        Team("젠지", "GenG.jpg"),
        Team("농심", "NS.jpg"),
        Team("리브샌박", "Liiv.jpg"),
        Team("아프리카", "Afreeca.jpg"),
        Team("프레딧", "Fredit.jpg"),
        Team("KT", "KT.jpg"),
        Team("DRX", "DRX.jpg"),
    ]
    
    var countTeamList: Int{
        return teamList.count
    }
    
    func teamInfo(at index:Int) -> Team {
        return teamList[index]
    }
}
