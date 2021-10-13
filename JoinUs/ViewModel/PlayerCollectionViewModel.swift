//
//  PlayerCollectionViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/12.
//

import Foundation

final class PlayerCollectionViewModel {
    let teamPlayerList: [[PlayerModel]] = [
        [PlayerModel(teamName: "DK", playerName: "ShowMaker", playerImageName: "ShowMaker.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "DK", playerName: "Canyon", playerImageName: "Canyon.jpg", playerLine: "JGL"),
         PlayerModel(teamName: "DK", playerName: "Khan", playerImageName: "Khan.jpg", playerLine: "Top"),
         PlayerModel(teamName: "DK", playerName: "BeryL", playerImageName: "BeryL.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "DK", playerName: "Ghost", playerImageName: "Ghost.jpg", playerLine: "BOT"),
        ],
        [PlayerModel(teamName: "HLE", playerName: "Chovy", playerImageName: "Chovy.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "HLE", playerName: "Deft", playerImageName: "Deft.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "HLE", playerName: "Vsta", playerImageName: "Vsta.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "HLE", playerName: "Morgan", playerImageName: "Morgan.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "HLE", playerName: "Willer", playerImageName: "Willer.jpg", playerLine: "JGL"),
        ],
        [PlayerModel(teamName: "T1", playerName: "Faker", playerImageName: "Faker.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "T1", playerName: "Canna", playerImageName: "Canna.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "T1", playerName: "Keria", playerImageName: "Keria.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "T1", playerName: "Gumayusi", playerImageName: "Gumayusi.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "T1", playerName: "Oner", playerImageName: "Oner.jpg", playerLine: "JGL"),
        ],
        [PlayerModel(teamName: "GenG", playerName: "Bdd", playerImageName: "Bdd.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "GenG", playerName: "Ruler", playerImageName: "Ruler.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "GenG", playerName: "Life", playerImageName: "Life.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "GenG", playerName: "Rascal", playerImageName: "Rascal.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "GenG", playerName: "Clid", playerImageName: "Clid.jpg", playerLine: "JGL"),
        ],
        [PlayerModel(teamName: "NS", playerName: "Gori", playerImageName: "Gori.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "NS", playerName: "deokdam", playerImageName: "deokdam.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "NS", playerName: "Rich", playerImageName: "Rich.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "NS", playerName: "Kellin", playerImageName: "Kellin.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "NS", playerName: "Peanut", playerImageName: "Peanut.jpg", playerLine: "JGL"),
        ],
        [PlayerModel(teamName: "Liiv", playerName: "FATE", playerImageName: "FATE.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "Liiv", playerName: "Summit", playerImageName: "Summit.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "Liiv", playerName: "Croco", playerImageName: "Croco.jpg", playerLine: "JGL"),
         PlayerModel(teamName: "Liiv", playerName: "Effort", playerImageName: "Effort.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "Liiv", playerName: "Prince", playerImageName: "Prince.jpg", playerLine: "BOT"),
        ],
        [PlayerModel(teamName: "AF", playerName: "Fly", playerImageName: "Fly.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "AF", playerName: "Kiin", playerImageName: "Kiin.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "AF", playerName: "Dread", playerImageName: "Dread.jpg", playerLine: "JGL"),
         PlayerModel(teamName: "AF", playerName: "Lehends", playerImageName: "Lehends.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "AF", playerName: "Leo", playerImageName: "Leo.jpg", playerLine: "BOT"),
        ],
        [PlayerModel(teamName: "Fredit", playerName: "Lava", playerImageName: "Lava.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "Fredit", playerName: "Hena", playerImageName: "Hena.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "Fredit", playerName: "Hoya", playerImageName: "Hoya.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "Fredit", playerName: "UmTi", playerImageName: "UmTi.jpg", playerLine: "JGL"),
         PlayerModel(teamName: "Fredit", playerName: "Delight", playerImageName: "Delight.jpg", playerLine: "SUP"),
        ],
        [PlayerModel(teamName: "KT", playerName: "Dove", playerImageName: "Dove.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "KT", playerName: "Doran", playerImageName: "Doran.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "KT", playerName: "5kid", playerImageName: "5kid.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "KT", playerName: "Zzus", playerImageName: "Zzus.jpg", playerLine: "SUP"),
         PlayerModel(teamName: "KT", playerName: "Blank", playerImageName: "Blank.jpg", playerLine: "JGL"),
        ],
        [PlayerModel(teamName: "DRX", playerName: "Jett", playerImageName: "Jett.jpg", playerLine: "Mid"),
         PlayerModel(teamName: "DRX", playerName: "Pyosik", playerImageName: "Pyosik.jpg", playerLine: "JGL"),
         PlayerModel(teamName: "DRX", playerName: "Kingen", playerImageName: "Kingen.jpg", playerLine: "TOP"),
         PlayerModel(teamName: "DRX", playerName: "Taeyoon", playerImageName: "Taeyoon.jpg", playerLine: "BOT"),
         PlayerModel(teamName: "DRX", playerName: "Jun", playerImageName: "Jun.jpg", playerLine: "SUP"),
        ]
    ]
    
    func countTeamPlayer(at teamIndex: Int) -> Int {
        return teamPlayerList[teamIndex].count
    }
    
    func teamPlayerInfo(teamIndex: Int, playerIndex: Int) -> PlayerModel {
        return teamPlayerList[teamIndex][playerIndex]
    }
}
