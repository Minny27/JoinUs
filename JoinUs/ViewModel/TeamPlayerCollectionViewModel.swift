//
// PlayerCollectionViewModel.swift
// JoinUs
//
// Created by SeungMin on 2021/10/12.
//

import Foundation
import UIKit

final class TeamPlayerCollectionViewModel {
  let teamPlayerList: [[Player]] = [
    [Player("DK", "ShowMaker", "ShowMaker.jpg", "MID", .systemGreen, "허수", "2000년 7월 22일 (21세)", "대한민국"),
     Player("DK", "Canyon", "Canyon.jpg", "JGL", .systemGreen, "김건부", "2001년 6월 18일 (20세)", "대한민국"),
     Player("DK", "Khan", "Khan.jpg", "TOP", .systemGreen, "김동하", "1995년 12월 22일 (25세)", "대한민국"),
     Player("DK", "BeryL", "BeryL.jpg", "SUP", .systemGreen, "조건희", "1997년 4월 1일 (24세)", "대한민국"),
     Player("DK", "Ghost", "Ghost.jpg", "BOT", .systemGreen, "장용준", "1999년 3월 18일 (22세)", "대한민국"),
    ],
    [Player("HLE", "Chovy", "Chovy.jpg", "MID", .systemOrange, "정지훈", "2001년 3월 3일 (20세)", "대한민국"),
     Player("HLE", "Deft", "Deft.jpg", "BOT", .systemOrange, "김혁규", "1996년 10월 23일 (25세)", "대한민국"),
     Player("HLE", "Vsta", "Vsta.jpg", "SUP", .systemOrange, "오효성", "2000년 10월 3일 (21세)", "대한민국"),
     Player("HLE", "Morgan", "Morgan.jpg", "TOP", .systemOrange, "박기태", "2001년 9월 26일 (20세)", "대한민국"),
     Player("HLE", "Willer", "Willer.jpg", "JGL", .systemOrange, "김정현", "2003년 4월 24일 (18세)", "대한민국"),
    ],
    [Player("T1", "Faker", "Faker.jpg", "MID", .systemRed, "이상혁", "1996년 5월 7일 (25세)", "대한민국"),
     Player("T1", "Canna", "Canna.jpg", "TOP", .systemRed, "김창동", "2000년 2월 11일 (21세)", "대한민국"),
     Player("T1", "Keria", "Keria.jpg", "SUP", .systemRed, "류민석", "2002년 10월 14일 (19세)", "대한민국"),
     Player("T1", "Gumayusi", "Gumayusi.jpg", "BOT", .systemRed, "이민형", "2002년 2월 6일 (19세)", "대한민국"),
     Player("T1", "Oner", "Oner.jpg", "JGL", .systemRed, "문현준", "2002년 12월 24일 (18세)", "대한민국"),
    ],
    [Player("GenG", "Bdd", "Bdd.jpg", "MID", .brown, "곽보성", "1999년 3월 1일 (22세)", "대한민국"),
     Player("GenG", "Ruler", "Ruler.jpg", "BOT", .brown, "박재혁", "1998년 12월 29일 (22세)", "대한민국"),
     Player("GenG", "Life", "Life.jpg", "SUP", .brown, "김정민", "2000년 7월 7일 (21세)", "대한민국"),
     Player("GenG", "Rascal", "Rascal.jpg", "TOP", .brown, "김광희", "1997년 10월 16일 (24세)", "대한민국"),
     Player("GenG", "Clid", "Clid.jpg", "JGL", .brown, "김태민", "1999년 7월 7일 (22세)", "대한민국"),
    ],
    [Player("NS", "Gori", "Gori.jpg", "MID", .systemRed, "김태우", "2000년 8월 9일 (21세)", "대한민국"),
     Player("NS", "deokdam", "deokdam.jpg", "BOT", .systemRed, "서대길", "2000년 2월 25일 (21세)", "대한민국"),
     Player("NS", "Rich", "Rich.jpg", "TOP", .systemRed, "이재원", "1998년 2월 16일 (23세)", "대한민국"),
     Player("NS", "Kellin", "Kellin.jpg", "SUP", .systemRed, "김형규", "2001년 2월 1일 (20세)", "대한민국"),
     Player("NS", "Peanut", "Peanut.jpg", "JGL", .systemRed, "한왕호", "1998년 2월 3일 (23세)", "대한민국"),
    ],
    [Player("Liiv", "FATE", "FATE.jpg", "MID", .systemYellow, "유수혁", "2000년 8월 22일 (21세)", "대한민국"),
     Player("Liiv", "Summit", "Summit.jpg", "TOP", .systemYellow, "박우태", "1998년 12월 8일 (23세)", "대한민국"),
     Player("Liiv", "Croco", "Croco.jpg", "JGL", .systemYellow, "김동범", "2000년 2월 23일 (21세)", "대한민국"),
     Player("Liiv", "Effort", "Effort.jpg", "SUP", .systemYellow, "이상호", "2000년 11월 23일 (21세)", "대한민국"),
     Player("Liiv", "Prince", "Prince.jpg", "BOT", .systemYellow, "이채환", "2000년 4월 5일 (21세)", "대한민국"),
    ],
    [Player("AF", "Fly", "Fly.jpg", "MID", .systemTeal, "송용준", "1996년 2월 25일 (25세)", "대한민국"),
     Player("AF", "Kiin", "Kiin.jpg", "TOP", .systemTeal, "김기인", "1999년 5월 28일 (22세)", "대한민국"),
     Player("AF", "Dread", "Dread.jpg", "JGL", .systemTeal, "이진혁", "2000년 6월 7일 (21세)", "대한민국"),
     Player("AF", "Lehends", "Lehends.jpg", "SUP", .systemTeal, "손시우", "1998년 12월 24일 (22세)", "대한민국"),
     Player("AF", "Leo", "Leo.jpg", "BOT", .systemTeal, "한겨레", "2000년 1월 12일 (21세)", "대한민국"),
    ],
    [Player("Fredit", "Lava", "Lava.jpg", "MID", .systemGreen, "김태훈", "1999년 7월 14일 (22세)", "대한민국"),
     Player("Fredit", "Hena", "Hena.jpg", "BOT", .systemGreen, "박증환", "1999년 10월 8일 (22세)", "대한민국"),
     Player("Fredit", "Hoya", "Hoya.jpg", "TOP", .systemGreen, "윤용호", "2000년 8월 25일 (21세)", "대한민국"),
     Player("Fredit", "UmTi", "UmTi.jpg", "JGL", .systemGreen, "엄성현", "1999년 6월 2일 (22세)", "대한민국"),
     Player("Fredit", "Delight", "Delight.jpg", "SUP", .systemGreen, "유환중", "2002년 9월 12일 (19세)", "대한민국"),
    ],
    [Player("KT", "Dove", "Dove.jpg", "MID", .orange, "김재연", "1998년 7월 25일 (23세)", "대한민국"),
     Player("KT", "Doran", "Doran.jpg", "TOP", .orange, "최현준", "2000년 7월 22일 (21세)", "대한민국"),
     Player("KT", "5kid", "5kid.jpg", "BOT", .orange, "박정현", "1999년 11월 28일 (22세)", "대한민국"),
     Player("KT", "Zzus", "Zzus.jpg", "SUP", .orange, "장준수", "1998년 8월 30일 (23세)", "대한민국"),
     Player("KT", "Blank", "Blank.jpg", "JGL", .orange, "강선구", "1998년 4월 30일 (23세)", "대한민국"),
    ],
    [Player("DRX", "Jett", "Jett.jpg", "MID", .link, "배호영", "2001년 7월 23일 (20세)", "대한민국"),
     Player("DRX", "Pyosik", "Pyosik.jpg", "JGL", .link, "홍창현", "2000년 3월 12일 (21세)", "대한민국"),
     Player("DRX", "Kingen", "Kingen.jpg", "TOP", .link, "황성훈", "2000년 3월 11일 (21세)", "대한민국"),
     Player("DRX", "Taeyoon", "Taeyoon.jpg", "BOT", .link, "김태윤", "2002년 6월 2일 (19세)", "대한민국"),
     Player("DRX", "Jun", "Jun.jpg", "SUP", .link, "윤세준", "2000년 8월 2일 (21세)", "대한민국"),
    ]
  ]
  
  func countTeamPlayerList(at teamIndex: Int) -> Int {
    return teamPlayerList[teamIndex].count
  }
  
  func teamPlayerInfo(teamIndex: Int, playerIndex: Int) -> Player {
    return teamPlayerList[teamIndex][playerIndex]
  }
}
