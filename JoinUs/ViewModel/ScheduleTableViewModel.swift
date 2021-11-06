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
    
    var countScheduleList: Int {
        return scheduleList.count
    }
    
    func scheduleInfo(at index: Int) -> ScheduleTableViewCellModel {
        return scheduleList[index]
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
        let leagueImage: String = schedule.league.imageUrl
        let league: String = schedule.league.name
        let date: String = self.dateFormatter.dateToString(date: schedule.beginAt, dateFormat: .date)
        let time: String = self.dateFormatter.dateToString(date: schedule.beginAt, dateFormat: .time)
        let status: String = schedule.status
        let tournamentName: String = schedule.name.components(separatedBy: ":")[0]
        let versus = schedule.status == "not_started" ? "VS" : ":"
        let homeTeam: String = schedule.name.components(separatedBy: " ")[1]
        let homeTeamImage: String = schedule.opponents[0].opponent.imageUrl
        let awayTeam: String = schedule.name.components(separatedBy: " ")[3]
        let awayTeamImage: String =  schedule.opponents[1].opponent.imageUrl
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
            leagueImage: leagueImage,
            league: league,
            date: date,
            time: time,
            status: status,
            tournamentName: tournamentName,
            versus: versus,
            homeTeam: homeTeam,
            homeTeamImage: homeTeamImage,
            awayTeam: awayTeam,
            awayTeamImage: awayTeamImage,
            homeTeamWinCount: homeTeamWinCount,
            awayTeamWinCount: awayTeamWinCount
        )
        
        return scheduleTableViewCellModel
    }
}
