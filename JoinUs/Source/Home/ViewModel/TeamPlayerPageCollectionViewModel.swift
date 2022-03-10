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
    [Player("T1", "Faker", "Faker.png", "MID", .red, "이상혁", "1996년 5월 7일 (25세)", "대한민국"),
     Player("T1", "Oner", "Oner.png", "JUG", .red, "문현준", "2002년 12월 24일 (19세)", "대한민국"),
     Player("T1", "Zeus", "Zeus.png", "TOP", .red, "최우제", "2004년 1월 31일 (18세)", "대한민국"),
     Player("T1", "Gumayusi", "Gumayusi.png", "BOT", .red, "이민형", "2002년 2월 6일 (20세)", "대한민국"),
     Player("T1", "Keria", "Keria.png", "SUP", .red, "류민석", "2002년 10월 14일 (19세)", "대한민국")
    ],
    [Player("GenG", "Chovy", "Chovy.png", "MID", .brown, "정지훈", "2001년 3월 3일 (21세)", "대한민국"),
     Player("GenG", "Peanut", "Peanut.png", "JUG", .brown, "한왕호", "1998년 2월 3일 (24세)", "대한민국"),
     Player("GenG", "Doran", "Doran.png", "TOP", .brown, "최현준", "2000년 7월 22일 (21세)", "대한민국"),
     Player("GenG", "Ruler", "Ruler.png", "BOT", .brown, "박재혁", "1998년 12월 29일 (23세)", "대한민국"),
     Player("GenG", "Lehends", "Lehends.png", "SUP", .brown, "손시우", "1998년 12월 24일 (23세)", "대한민국")
    ],
    [Player("DK", "ShowMaker", "ShowMaker.png", "MID", .systemGreen, "허수", "2000년 7월 22일 (21세)", "대한민국"),
     Player("DK", "Canyon", "Canyon.png", "JUG", .systemGreen, "김건부", "2001년 6월 18일 (20세)", "대한민국"),
     Player("DK", "Burdol", "Burdol.png", "TOP", .systemGreen, "노태윤", "2003년 12월 25일 (18세)", "대한민국"),
     Player("DK", "deokdam", "deokdam.png", "BOT", .systemGreen, "서대길", "2000년 2월 25일 (22세)", "대한민국"),
     Player("DK", "Kellin", "Kellin.png", "SUP", .systemGreen, "김형규", "2001년 2월 1일 (21세)", "대한민국")
    ],
    [Player("DRX", "Zeka", "Zeka.png", "MID", .link, "김건우", "2002년 11월 28일 (19세)", "대한민국"),
     Player("DRX", "Pyosik", "Pyosik.png", "JUG", .link, "홍창현", "2000년 3월 12일 (21세)", "대한민국"),
     Player("DRX", "Kingen", "Kingen.png", "TOP", .link, "황성훈", "2000년 3월 11일 (21세)", "대한민국"),
     Player("DRX", "Deft", "Deft.png", "BOT", .link, "김혁규", "1996년 10월 23일 (25세)", "대한민국"),
     Player("DRX", "BeryL", "BeryL.png", "SUP", .link, "조건희", "1997년 4월 1일 (24세)", "대한민국")
    ],
    [Player("Kwangdong", "FATE", "FATE.jpeg", "MID", .orange, "유수혁", "2000년 8월 22일 (21세)", "대한민국"),
     Player("Kwangdong", "Ellim", "Ellim.jpeg", "JUG", .orange, "최엘림", "2000년 5월 25일 (21세)", "대한민국"),
     Player("Kwangdong", "Kiin", "Kiin.jpeg", "TOP", .orange, "김기인", "1999년 5월 28일 (22세)", "대한민국"),
     Player("Kwangdong", "Teddy", "Teddy.png", "BOT", .orange, "박진성", "1998년 3월 15일 (23세)", "대한민국"),
     Player("Kwangdong", "Hoit", "Hoit.jpeg", "SUP", .orange, "류호성", "1999년 7월 6일 (22세)", "대한민국")
    ],
    [Player("Fredit", "Lava", "Lava.png", "MID", .systemGreen, "김태훈", "1999년 7월 14일 (22세)", "대한민국"),
     Player("Fredit", "UmTi", "UmTi.png", "JUG", .systemGreen, "엄성현", "1999년 6월 2일 (22세)", "대한민국"),
     Player("Fredit", "Morgan", "Morgan.png", "TOP", .systemGreen, "박루한", "2001년 9월 26일 (20세)", "대한민국"),
     Player("Fredit", "Hena", "Hena.png", "BOT", .systemGreen, "박증환", "1999년 10월 8일 (22세)", "대한민국"),
     Player("Fredit", "Delight", "Delight.png", "SUP", .systemGreen, "유환중", "2002년 9월 12일 (19세)", "대한민국")
    ],
    [Player("NS", "Bdd", "Bdd.png", "MID", .systemRed, "곽보성", "1999년 3월 1일 (23세)", "대한민국"),
     Player("NS", "Dread", "Dread.png", "JUG", .systemRed, "이진혁", "2000년 6월 7일 (21세)", "대한민국"),
     Player("NS", "Canna", "Canna.png", "TOP", .systemRed, "김창동", "2000년 2월 11일 (22세)", "대한민국"),
     Player("NS", "Ghost", "Ghost.png", "BOT", .systemRed, "장용준", "1999년 3월 18일 (22세)", "대한민국"),
     Player("NS", "Effort", "Effort.png", "SUP", .systemRed, "이상호", "2000년 11월 23일 (21세)", "대한민국")
    ],
    [Player("KT", "Aria", "Aria.jpeg", "MID", .orange, "이가을", "2000년 10월 14일 (21세)", "대한민국"),
     Player("KT", "Cuzz", "Cuzz.jpeg", "JUG", .orange, "문우찬", "1999년 10월 30일 (22세)", "대한민국"),
     Player("KT", "Rascal", "Rascal.jpeg", "TOP", .orange, "김광희", "1997년 10월 16일 (24세)", "대한민국"),
     Player("KT", "Aiming", "Aiming.jpeg", "BOT", .orange, "김하람", "2000년 7월 20일 (21세)", "대한민국"),
     Player("KT", "Life", "Life.jpeg", "SUP", .orange, "김정민", "2000년 7월 7일 (21세)", "대한민국")
    ],
    [Player("Liiv", "Clozer", "Clozer.png", "MID", .systemYellow, "이주현", "2003년 7월 27일 (18세)", "대한민국"),
     Player("Liiv", "Croco", "Croco.png", "JUG", .systemYellow, "김동범", "2000년 2월 23일 (22세)", "대한민국"),
     Player("Liiv", "Dove", "Dove.png", "TOP", .systemYellow, "김재연", "1998년 7월 25일 (23세)", "대한민국"),
     Player("Liiv", "Ice", "Ice.png", "BOT", .systemYellow, "윤상훈", "2001년 4월 9일 (20세)", "대한민국"),
     Player("Liiv", "Kael", "Kael.png", "SUP", .systemYellow, "김진홍", "2004년 2월 11일 (18세)", "대한민국")
    ],
    [Player("HLE", "Karis", "Karis.png", "MID", .systemOrange, "김홍조", "2003년 5월 21일 (18세)", "대한민국"),
     Player("HLE", "OnFleek", "OnFleek.png", "JUG", .systemOrange, "김장겸", "1997년 12월 20일 (24세)", "대한민국"),
     Player("HLE", "DuDu", "DuDu.png", "TOP", .systemOrange, "이동주", "2001년 3월 8일 (20세)", "대한민국"),
     Player("HLE", "SamD", "SamD.png", "BOT", .systemOrange, "이재훈", "2001년 3월 14일 (20세)", "대한민국"),
     Player("HLE", "Vsta", "Vsta.png", "SUP", .systemOrange, "오효성", "2000년 10월 3일 (21세)", "대한민국")
    ]
  ]
  
  func countTeamPlayerList(at teamIndex: Int) -> Int {
    return teamPlayerList[teamIndex].count
  }
  
  func teamPlayerInfo(teamIndex: Int, playerIndex: Int) -> Player {
    return teamPlayerList[teamIndex][playerIndex]
  }
}
