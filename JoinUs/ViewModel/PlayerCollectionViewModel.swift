//
//  PlayerCollectionViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/12/03.
//

import Foundation
import UIKit

final class PlayerCollectionViewModel {    
    let playerList: [Player] = [
        Player("DK", "ShowMaker", "ShowMaker.jpg", "MID", .systemGreen, "허수(프로게이머)"),
        Player("DK", "Canyon", "Canyon.jpg", "JGL", .systemGreen, "김건부"),
        Player("DK", "Khan", "Khan.jpg", "TOP", .systemGreen, "김동하(프로게이머)"),
        Player("DK", "BeryL", "BeryL.jpg", "SUP", .systemGreen, "조건희"),
        Player("DK", "Ghost", "Ghost.jpg", "BOT", .systemGreen, "장용준"),
        Player("HLE", "Chovy", "Chovy.jpg", "MID", .systemOrange, "정지훈(2001)"),
        Player("HLE", "Deft", "Deft.jpg", "BOT", .systemOrange, "김혁규"),
        Player("HLE", "Vsta", "Vsta.jpg", "SUP", .systemOrange, "오효성"),
        Player("HLE", "Morgan", "Morgan.jpg", "TOP", .systemOrange, "박기태"),
        Player("HLE", "Willer", "Willer.jpg", "JGL", .systemOrange, "김정현(2003)"),
        Player("T1", "Faker", "Faker.jpg", "MID", .systemRed, "이상혁"),
        Player("T1", "Canna", "Canna.jpg", "TOP", .systemRed, "김창동"),
        Player("T1", "Keria", "Keria.jpg", "SUP", .systemRed, "류민석"),
        Player("T1", "Gumayusi", "Gumayusi.jpg", "BOT", .systemRed, "이민형(프로게이머)"),
        Player("T1", "Oner", "Oner.jpg", "JGL", .systemRed, "문현준"),
        Player("GenG", "Bdd", "Bdd.jpg", "MID", .brown, "곽보성"),
        Player("GenG", "Ruler", "Ruler.jpg", "BOT", .brown, "박재혁(1998)"),
        Player("GenG", "Life", "Life.jpg", "SUP", .brown, "김정민(2000)"),
        Player("GenG", "Rascal", "Rascal.jpg", "TOP", .brown, "김광희"),
        Player("GenG", "Clid", "Clid.jpg", "JGL", .brown, "김태민(프로게이머)"),
        Player("NS", "Gori", "Gori.jpg", "MID", .systemRed, "김태우(프로게이머)"),
        Player("NS", "deokdam", "deokdam.jpg", "BOT", .systemRed, "서대길"),
        Player("NS", "Rich", "Rich.jpg", "TOP", .systemRed, "이재원(프로게이머)"),
        Player("NS", "Kellin", "Kellin.jpg", "SUP", .systemRed, "김형규(프로게이머)"),
        Player("NS", "Peanut", "Peanut.jpg", "JGL", .systemRed, "한왕호"),
        Player("Liiv", "FATE", "FATE.jpg", "MID", .systemYellow, "유수혁"),
        Player("Liiv", "Summit", "Summit.jpg", "TOP", .systemYellow, "박우태"),
        Player("Liiv", "Croco", "Croco.jpg", "JGL", .systemYellow, "김동범(프로게이머)"),
        Player("Liiv", "Effort", "Effort.jpg", "SUP", .systemYellow, "이상호(프로게이머)"),
        Player("Liiv", "Prince", "Prince.jpg", "BOT", .systemYellow, "이채환"),
        Player("AF", "Fly", "Fly.jpg", "MID", .systemTeal, "송용준"),
        Player("AF", "Kiin", "Kiin.jpg", "TOP", .systemTeal, "김기인"),
        Player("AF", "Dread", "Dread.jpg", "JGL", .systemTeal, "이진혁(프로게이머)"),
        Player("AF", "Lehends", "Lehends.jpg", "SUP", .systemTeal, "손시우"),
        Player("AF", "Leo", "Leo.jpg", "BOT", .systemTeal, "한겨레(프로게이머)"),
        Player("Fredit", "Lava", "Lava.jpg", "MID", .systemGreen, "김태훈(1999)"),
        Player("Fredit", "Hena", "Hena.jpg", "BOT", .systemGreen, "박증환"),
        Player("Fredit", "Hoya", "Hoya.jpg", "TOP", .systemGreen, "윤용호(프로게이머)"),
        Player("Fredit", "UmTi", "UmTi.jpg", "JGL", .systemGreen, "엄성현"),
        Player("Fredit", "Delight", "Delight.jpg", "SUP", .systemGreen, "유환중"),
        Player("KT", "Dove", "Dove.jpg", "MID", .orange, "김재연(프로게이머)"),
        Player("KT", "Doran", "Doran.jpg", "TOP", .orange, "최현준(프로게이머)"),
        Player("KT", "5kid", "5kid.jpg", "BOT", .orange, "박정현(프로게이머)"),
        Player("KT", "Zzus", "Zzus.jpg", "SUP", .orange, "장준수"),
        Player("KT", "Blank", "Blank.jpg", "JGL", .orange, "강선구"),
        Player("DRX", "Jett", "Jett.jpg", "MID", .link, "배호영"),
        Player("DRX", "Pyosik", "Pyosik.jpg", "JGL", .link, "홍창현"),
        Player("DRX", "Kingen", "Kingen.jpg", "TOP", .link, "황성훈"),
        Player("DRX", "Taeyoon", "Taeyoon.jpg", "BOT", .link, "김태윤(프로게이머)"),
        Player("DRX", "Jun", "Jun.jpg", "SUP", .link, "윤세준")
    ]
    
    var countPlayerList: Int {
        return playerList.count
    }
    
    func playerInfo(at Index: Int) -> Player {
        return playerList[Index]
    }
}
