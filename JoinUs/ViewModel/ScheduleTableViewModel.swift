//
//  ScheduleTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/22.
//

import Foundation

final class ScheduleTableViewModel {
    private let dateFormatter = DateFormatter()
    var scheduleList: [ScheduleTableViewCellModel] = []
    var dataType: RequestScheduleType
    
    init(dataType: RequestScheduleType) {
        self.dataType = dataType
    }
    
    func update(scheduleInfo: ScheduleTableViewModel) {
        
    }
    
    func fetchData() {
        NetworkManger().getScheduleData(dataType: dataType) { receivedScheduleModel in
            receivedScheduleModel.compactMap({ schedule in
                self.scheduleList.append(self.extractScehduleData(schedule: schedule))
            })
            print(self.scheduleList)
        }
    }
    
    func extractScehduleData(schedule: ReceivedScheduleModel) -> ScheduleTableViewCellModel {
        let leagueLogo: String = schedule.league.imageUrl
        let league: String = schedule.league.name
        let date: String = self.dateFormatter.dateToString(date: schedule.beginAt, dateFormat: .date)
        let time: String = self.dateFormatter.dateToString(date: schedule.beginAt, dateFormat: .time)
        let status: String = schedule.status
        let tournamentName: String = schedule.name.components(separatedBy: ":")[0]
        let homeTeam: String = schedule.name.components(separatedBy: " ")[1]
        let homeTeamLogo: String = schedule.opponents[0].opponent.imageUrl
        let awayTeam: String = schedule.name.components(separatedBy: " ")[3]
        let awayTeamLogo: String =  schedule.opponents[1].opponent.imageUrl
        var homeTeamWinCount: Int = 0
        var awayTeamWinCount: Int = 0
        
        if status != "not_started" {
            for index in 0..<schedule.games.count {
                if schedule.opponents[0].opponent.id == schedule.games[index].winner.id {
                    homeTeamWinCount += 1
                }
                
                else {
                    awayTeamWinCount += 1
                }
            }
        }
        
        let scheduleTableViewCellModel = ScheduleTableViewCellModel(
            leagueLogo: leagueLogo,
            league: league,
            date: date,
            time: time,
            status: status,
            tournamentName: tournamentName,
            homeTeam: homeTeam,
            homeTeamLogo: homeTeamLogo,
            awayTeam: awayTeam,
            awayTeamLogo: awayTeamLogo,
            homeTeamWinCount: homeTeamWinCount,
            awayTeamWinCount: awayTeamWinCount
        )
        
        return scheduleTableViewCellModel
    }
}
