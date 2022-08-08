//
// PlayerCollectionViewModel.swift
// JoinUs
//
// Created by SeungMin on 2021/10/12.
//

import Foundation
import UIKit

final class TeamPlayerPageCollectionViewModel {
  let teamPlayerList: [[Player]] = [
    [Player("T1", "Faker", "Faker.png", "MID", UIColor(named: "T1_color")!, "이상혁", "1996년 5월 7일", "대한민국"),
     Player("T1", "Oner", "Oner.png", "JUG", UIColor(named: "T1_color")!, "문현준", "2002년 12월 24일", "대한민국"),
     Player("T1", "Zeus", "Zeus.png", "TOP", UIColor(named: "T1_color")!, "최우제", "2004년 1월 31일", "대한민국"),
     Player("T1", "Gumayusi", "Gumayusi.png", "BOT", UIColor(named: "T1_color")!, "이민형", "2002년 2월 6일", "대한민국"),
     Player("T1", "Keria", "Keria.png", "SUP", UIColor(named: "T1_color")!, "류민석", "2002년 10월 14일", "대한민국")
    ],
    [Player("GenG", "Chovy", "Chovy.png", "MID", UIColor(named: "GenG_color")!, "정지훈", "2001년 3월 3일", "대한민국"),
     Player("GenG", "Peanut", "Peanut.png", "JUG", UIColor(named: "GenG_color")!, "한왕호", "1998년 2월 3일", "대한민국"),
     Player("GenG", "Doran", "Doran.png", "TOP", UIColor(named: "GenG_color")!, "최현준", "2000년 7월 22일", "대한민국"),
     Player("GenG", "Ruler", "Ruler.png", "BOT", UIColor(named: "GenG_color")!, "박재혁", "1998년 12월 29일", "대한민국"),
     Player("GenG", "Lehends", "Lehends.png", "SUP", UIColor(named: "GenG_color")!, "손시우", "1998년 12월 24일", "대한민국")
    ],
    [Player("DK", "ShowMaker", "ShowMaker.png", "MID", UIColor(named: "DK_color")!, "허수", "2000년 7월 22일", "대한민국"),
     Player("DK", "Canyon", "Canyon.png", "JUG", UIColor(named: "DK_color")!, "김건부", "2001년 6월 18일", "대한민국"),
     Player("DK", "Nuguri", "Nuguri.png", "TOP", UIColor(named: "DK_color")!, "장하권", "1999년 7월 17일", "대한민국"),
     Player("DK", "deokdam", "deokdam.png", "BOT", UIColor(named: "DK_color")!, "서대길", "2000년 2월 25일", "대한민국"),
     Player("DK", "Bible", "Bible.png", "SUP", UIColor(named: "DK_color")!, "윤설", "1999년 11월 24일", "대한민국")
    ],
    [Player("DRX", "Zeka", "Zeka.png", "MID", UIColor(named: "DRX_color")!, "김건우", "2002년 11월 28일", "대한민국"),
     Player("DRX", "Pyosik", "Pyosik.png", "JUG", UIColor(named: "DRX_color")!, "홍창현", "2000년 3월 12일", "대한민국"),
     Player("DRX", "Kingen", "Kingen.png", "TOP", UIColor(named: "DRX_color")!, "황성훈", "2000년 3월 11일", "대한민국"),
     Player("DRX", "Deft", "Deft.png", "BOT", UIColor(named: "DRX_color")!, "김혁규", "1996년 10월 23일", "대한민국"),
     Player("DRX", "BeryL", "BeryL.png", "SUP", UIColor(named: "DRX_color")!, "조건희", "1997년 4월 1일", "대한민국")
    ],
    [Player("Kwangdong", "FATE", "FATE.png", "MID", UIColor(named: "KD_color")!, "유수혁", "2000년 8월 22일", "대한민국"),
     Player("Kwangdong", "Ellim", "Ellim.png", "JUG", UIColor(named: "KD_color")!, "최엘림", "2000년 5월 25일", "대한민국"),
     Player("Kwangdong", "Kiin", "Kiin.png", "TOP", UIColor(named: "KD_color")!, "김기인", "1999년 5월 28일", "대한민국"),
     Player("Kwangdong", "Teddy", "Teddy.png", "BOT", UIColor(named: "KD_color")!, "박진성", "1998년 3월 15일", "대한민국"),
     Player("Kwangdong", "Moham", "Moham.png", "SUP", UIColor(named: "KD_color")!, "정재훈", "2002년 8월 8일", "대한민국")
    ],
    [Player("Fredit", "Lava", "Lava.png", "MID", UIColor(named: "Brion_color")!, "김태훈", "1999년 7월 14일", "대한민국"),
     Player("Fredit", "UmTi", "UmTi.png", "JUG", UIColor(named: "Brion_color")!, "엄성현", "1999년 6월 2일", "대한민국"),
     Player("Fredit", "Morgan", "Morgan.png", "TOP", UIColor(named: "Brion_color")!, "박루한", "2001년 9월 26일", "대한민국"),
     Player("Fredit", "Hena", "Hena.png", "BOT", UIColor(named: "Brion_color")!, "박증환", "1999년 10월 8일", "대한민국"),
     Player("Fredit", "Delight", "Delight.png", "SUP", UIColor(named: "Brion_color")!, "유환중", "2002년 9월 12일", "대한민국")
    ],
    [Player("NS", "Bdd", "Bdd.png", "MID", UIColor(named: "NS_color")!, "곽보성", "1999년 3월 1일", "대한민국"),
     Player("NS", "Dread", "Dread.png", "JUG", UIColor(named: "NS_color")!, "이진혁", "2000년 6월 7일", "대한민국"),
     Player("NS", "Canna", "Canna.png", "TOP", UIColor(named: "NS_color")!, "김창동", "2000년 2월 11일", "대한민국"),
     Player("NS", "Ghost", "Ghost.png", "BOT", UIColor(named: "NS_color")!, "장용준", "1999년 3월 18일", "대한민국"),
     Player("NS", "SnowFlower", "SnowFlower.png", "SUP", UIColor(named: "NS_color")!, "노회종", "1997년 2월 24일", "대한민국")
    ],
    [Player("KT", "VicLa", "VicLa.png", "MID", UIColor(named: "KT_color")!, "이대광", "2003년 11월 27일", "대한민국"),
     Player("KT", "Cuzz", "Cuzz.png", "JUG", UIColor(named: "KT_color")!, "문우찬", "1999년 10월 30일", "대한민국"),
     Player("KT", "Rascal", "Rascal.png", "TOP", UIColor(named: "KT_color")!, "김광희", "1997년 10월 16일", "대한민국"),
     Player("KT", "Aiming", "Aiming.png", "BOT", UIColor(named: "KT_color")!, "김하람", "2000년 7월 20일", "대한민국"),
     Player("KT", "Life", "Life.png", "SUP", UIColor(named: "KT_color")!, "김정민", "2000년 7월 7일", "대한민국")
    ],
    [Player("Liiv", "Clozer", "Clozer.png", "MID", UIColor(named: "Liiv_color")!, "이주현", "2003년 7월 27일", "대한민국"),
     Player("Liiv", "Croco", "Croco.png", "JUG", UIColor(named: "Liiv_color")!, "김동범", "2000년 2월 23일", "대한민국"),
     Player("Liiv", "Dove", "Dove.png", "TOP", UIColor(named: "Liiv_color")!, "김재연", "1998년 7월 25일", "대한민국"),
     Player("Liiv", "Prince", "Prince.png", "BOT", UIColor(named: "Liiv_color")!, "이채환", "2000년 4월 5일", "대한민국"),
     Player("Liiv", "Kael", "Kael.png", "SUP", UIColor(named: "Liiv_color")!, "김진홍", "2004년 2월 11일", "대한민국")
    ],
    [Player("HLE", "Karis", "Karis.png", "MID", UIColor(named: "HLE_color")!, "김홍조", "2003년 5월 21일", "대한민국"),
     Player("HLE", "OnFleek", "OnFleek.png", "JUG", UIColor(named: "HLE_color")!, "김장겸", "1997년 12월 20일", "대한민국"),
     Player("HLE", "DuDu", "DuDu.png", "TOP", UIColor(named: "HLE_color")!, "이동주", "2001년 3월 8일", "대한민국"),
     Player("HLE", "SamD", "SamD.png", "BOT", UIColor(named: "HLE_color")!, "이재훈", "2001년 3월 14일", "대한민국"),
     Player("HLE", "Vsta", "Vsta.png", "SUP", UIColor(named: "HLE_color")!, "오효성", "2000년 10월 3일", "대한민국")
    ]
  ]
  
  func countTeamPlayerList(at teamIndex: Int) -> Int {
    return teamPlayerList[teamIndex].count
  }
  
  func teamPlayerInfo(teamIndex: Int, playerIndex: Int) -> Player {
    return teamPlayerList[teamIndex][playerIndex]
  }
}
