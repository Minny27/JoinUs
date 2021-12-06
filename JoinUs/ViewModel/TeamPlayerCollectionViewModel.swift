//
//  PlayerCollectionViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import Foundation
import UIKit

final class TeamPlayerCollectionViewModel {
    let teamPlayerList: [[PlayerModel]] = [
        [PlayerModel(teamName: "DK", playerName: "ShowMaker", playerImageName: "ShowMaker.jpg", playerLine: "MID", teamColor: .systemGreen),
         PlayerModel(teamName: "DK", playerName: "Canyon", playerImageName: "Canyon.jpg", playerLine: "JGL", teamColor: .systemGreen),
         PlayerModel(teamName: "DK", playerName: "Khan", playerImageName: "Khan.jpg", playerLine: "TOP", teamColor: .systemGreen),
         PlayerModel(teamName: "DK", playerName: "BeryL", playerImageName: "BeryL.jpg", playerLine: "SUP", teamColor: .systemGreen),
         PlayerModel(teamName: "DK", playerName: "Ghost", playerImageName: "Ghost.jpg", playerLine: "BOT", teamColor: .systemGreen),
        ],
        [PlayerModel(teamName: "HLE", playerName: "Chovy", playerImageName: "Chovy.jpg", playerLine: "MID", teamColor: .systemOrange),
         PlayerModel(teamName: "HLE", playerName: "Deft", playerImageName: "Deft.jpg", playerLine: "BOT", teamColor: .systemOrange),
         PlayerModel(teamName: "HLE", playerName: "Vsta", playerImageName: "Vsta.jpg", playerLine: "SUP", teamColor: .systemOrange),
         PlayerModel(teamName: "HLE", playerName: "Morgan", playerImageName: "Morgan.jpg", playerLine: "TOP", teamColor: .systemOrange),
         PlayerModel(teamName: "HLE", playerName: "Willer", playerImageName: "Willer.jpg", playerLine: "JGL", teamColor: .systemOrange),
        ],
        [PlayerModel(teamName: "T1", playerName: "Faker", playerImageName: "Faker.jpg", playerLine: "MID", teamColor: .systemRed),
         PlayerModel(teamName: "T1", playerName: "Canna", playerImageName: "Canna.jpg", playerLine: "TOP", teamColor: .systemRed),
         PlayerModel(teamName: "T1", playerName: "Keria", playerImageName: "Keria.jpg", playerLine: "SUP", teamColor: .systemRed),
         PlayerModel(teamName: "T1", playerName: "Gumayusi", playerImageName: "Gumayusi.jpg", playerLine: "BOT", teamColor: .systemRed),
         PlayerModel(teamName: "T1", playerName: "Oner", playerImageName: "Oner.jpg", playerLine: "JGL", teamColor: .systemRed),
        ],
        [PlayerModel(teamName: "GenG", playerName: "Bdd", playerImageName: "Bdd.jpg", playerLine: "MID", teamColor: .brown),
         PlayerModel(teamName: "GenG", playerName: "Ruler", playerImageName: "Ruler.jpg", playerLine: "BOT", teamColor: .brown),
         PlayerModel(teamName: "GenG", playerName: "Life", playerImageName: "Life.jpg", playerLine: "SUP", teamColor: .brown),
         PlayerModel(teamName: "GenG", playerName: "Rascal", playerImageName: "Rascal.jpg", playerLine: "TOP", teamColor: .brown),
         PlayerModel(teamName: "GenG", playerName: "Clid", playerImageName: "Clid.jpg", playerLine: "JGL", teamColor: .brown),
        ],
        [PlayerModel(teamName: "NS", playerName: "Gori", playerImageName: "Gori.jpg", playerLine: "MID", teamColor: .systemRed),
         PlayerModel(teamName: "NS", playerName: "deokdam", playerImageName: "deokdam.jpg", playerLine: "BOT", teamColor: .systemRed),
         PlayerModel(teamName: "NS", playerName: "Rich", playerImageName: "Rich.jpg", playerLine: "TOP", teamColor: .systemRed),
         PlayerModel(teamName: "NS", playerName: "Kellin", playerImageName: "Kellin.jpg", playerLine: "SUP", teamColor: .systemRed),
         PlayerModel(teamName: "NS", playerName: "Peanut", playerImageName: "Peanut.jpg", playerLine: "JGL", teamColor: .systemRed),
        ],
        [PlayerModel(teamName: "Liiv", playerName: "FATE", playerImageName: "FATE.jpg", playerLine: "MID", teamColor: .systemYellow),
         PlayerModel(teamName: "Liiv", playerName: "Summit", playerImageName: "Summit.jpg", playerLine: "TOP", teamColor: .systemYellow),
         PlayerModel(teamName: "Liiv", playerName: "Croco", playerImageName: "Croco.jpg", playerLine: "JGL", teamColor: .systemYellow),
         PlayerModel(teamName: "Liiv", playerName: "Effort", playerImageName: "Effort.jpg", playerLine: "SUP", teamColor: .systemYellow),
         PlayerModel(teamName: "Liiv", playerName: "Prince", playerImageName: "Prince.jpg", playerLine: "BOT", teamColor: .systemYellow),
        ],
        [PlayerModel(teamName: "AF", playerName: "Fly", playerImageName: "Fly.jpg", playerLine: "MID", teamColor: .systemTeal),
         PlayerModel(teamName: "AF", playerName: "Kiin", playerImageName: "Kiin.jpg", playerLine: "TOP", teamColor: .systemTeal),
         PlayerModel(teamName: "AF", playerName: "Dread", playerImageName: "Dread.jpg", playerLine: "JGL", teamColor: .systemTeal),
         PlayerModel(teamName: "AF", playerName: "Lehends", playerImageName: "Lehends.jpg", playerLine: "SUP", teamColor: .systemTeal),
         PlayerModel(teamName: "AF", playerName: "Leo", playerImageName: "Leo.jpg", playerLine: "BOT", teamColor: .systemTeal),
        ],
        [PlayerModel(teamName: "Fredit", playerName: "Lava", playerImageName: "Lava.jpg", playerLine: "MID", teamColor: .systemGreen),
         PlayerModel(teamName: "Fredit", playerName: "Hena", playerImageName: "Hena.jpg", playerLine: "BOT", teamColor: .systemGreen),
         PlayerModel(teamName: "Fredit", playerName: "Hoya", playerImageName: "Hoya.jpg", playerLine: "TOP", teamColor: .systemGreen),
         PlayerModel(teamName: "Fredit", playerName: "UmTi", playerImageName: "UmTi.jpg", playerLine: "JGL", teamColor: .systemGreen),
         PlayerModel(teamName: "Fredit", playerName: "Delight", playerImageName: "Delight.jpg", playerLine: "SUP", teamColor: .systemGreen),
        ],
        [PlayerModel(teamName: "KT", playerName: "Dove", playerImageName: "Dove.jpg", playerLine: "MID", teamColor: .orange),
         PlayerModel(teamName: "KT", playerName: "Doran", playerImageName: "Doran.jpg", playerLine: "TOP", teamColor: .orange),
         PlayerModel(teamName: "KT", playerName: "5kid", playerImageName: "5kid.jpg", playerLine: "BOT", teamColor: .orange),
         PlayerModel(teamName: "KT", playerName: "Zzus", playerImageName: "Zzus.jpg", playerLine: "SUP", teamColor: .orange),
         PlayerModel(teamName: "KT", playerName: "Blank", playerImageName: "Blank.jpg", playerLine: "JGL", teamColor: .orange),
        ],
        [PlayerModel(teamName: "DRX", playerName: "Jett", playerImageName: "Jett.jpg", playerLine: "MID", teamColor: .link),
         PlayerModel(teamName: "DRX", playerName: "Pyosik", playerImageName: "Pyosik.jpg", playerLine: "JGL", teamColor: .link),
         PlayerModel(teamName: "DRX", playerName: "Kingen", playerImageName: "Kingen.jpg", playerLine: "TOP", teamColor: .link),
         PlayerModel(teamName: "DRX", playerName: "Taeyoon", playerImageName: "Taeyoon.jpg", playerLine: "BOT", teamColor: .link),
         PlayerModel(teamName: "DRX", playerName: "Jun", playerImageName: "Jun.jpg", playerLine: "SUP", teamColor: .link),
        ]
    ]
    
    func countTeamPlayerList(at teamIndex: Int) -> Int {
        return teamPlayerList[teamIndex].count
    }
    
    func teamPlayerInfo(teamIndex: Int, playerIndex: Int) -> PlayerModel {
        return teamPlayerList[teamIndex][playerIndex]
    }
}
