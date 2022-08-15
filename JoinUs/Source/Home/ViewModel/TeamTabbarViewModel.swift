//
//TeamTabbarViewModel.swift
//JoinUs
//
//CreatedbySeungMinon2021/10/06.
//

import Foundation
import UIKit

final class TeamTabbarViewModel{
    let teamList: [Team] = [
        Team("T1", "T1", UIColor(named: "T1_color")!),
        Team("젠지", "GenG", UIColor(named: "GenG_color")!),
        Team("담원기아", "DK", UIColor(named: "DK_color")!),
        Team("DRX", "DRX", UIColor(named: "DRX_color")!),
        Team("광동", "Kwangdong", UIColor(named: "KD_color")!),
        Team("프레딧", "Fredit", UIColor(named: "Brion_color")!),
        Team("농심", "NS", UIColor(named: "NS_color")!),
        Team("KT", "KT", UIColor(named: "KT_color")!),
        Team("리브샌박", "Liiv", UIColor(named: "Liiv_color")!),
        Team("한화생명", "HLE", UIColor(named: "HLE_color")!),
    ]
    
    var countTeamList: Int{
        return teamList.count
    }
    
    func teamInfo(at index:Int) -> Team {
        return teamList[index]
    }
}
