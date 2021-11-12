//
//  ScheduleTableViewModel.swift
//  JoinUs
//
//  Created by SeungMin on 2021/10/22.
//

import Foundation

final class ScheduleTableViewModel {
    private let dateFormatter = DateFormatter()
    var scheduleList: Observable<[ScheduleTableViewCellModel]> = Observable([])
    var dataType: RequestScheduleType
    
    var countScheduleList: Int {
        return scheduleList.value?.count ?? 0
    }
    
    init(dataType: RequestScheduleType) {
        self.dataType = dataType
    }
    
    func scheduleInfo(at index: Int) -> ScheduleTableViewCellModel? {
        return scheduleList.value?[index]
    }
    
    func fetchData() {
        NetworkManger().getScheduleData(dataType: dataType) { receivedScheduleModel in
            self.scheduleList.value = receivedScheduleModel.compactMap({ schedule in
                self.extractScehduleData(schedule: schedule)
            })
        }
    }
    
    func extractScehduleData(schedule: ReceivedScheduleModel) -> ScheduleTableViewCellModel {
        let leagueImage: String = schedule.league.imageUrl
        let league: String = schedule.league.name
        let date: String = self.dateFormatter.dateToString(date: schedule.originalScheduledAt, dateFormat: .date)
        let time: String = self.dateFormatter.dateToString(date: schedule.originalScheduledAt, dateFormat: .time).replacingOccurrences(of: "-", with: ":")
        let status: String = schedule.status
        let versus = schedule.status == "not_started" ? "vs" : ":"
        let homeTeamId:Int = schedule.opponents[0].opponent.id
        let homeTeam: String = getTeam(totalName: schedule.name).homeTeam
        let homeTeamImage: Data = try! Data(contentsOf: URL(string: schedule.opponents[0].opponent.imageUrl)!)
        let awayTeamId:Int = schedule.opponents[1].opponent.id
        let awayTeam: String = getTeam(totalName: schedule.name).awayTeam
        let awayTeamImage: Data = try! Data(contentsOf: URL(string: schedule.opponents[1].opponent.imageUrl)!)
        var homeTeamWinCount: Int = 0
        var awayTeamWinCount: Int = 0
        let winnerId = schedule.winnerId
        
        // status: - finished, running, not_started
        if status != "not_started" {
            for index in 0..<schedule.games.count {
                if schedule.opponents[0].opponent.id == schedule.games[index].winner.id {
                    homeTeamWinCount += 1
                }
                
                else if schedule.opponents[1].opponent.id == schedule.games[index].winner.id {
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
            versus: versus,
            homeTeamId: homeTeamId,
            homeTeam: homeTeam,
            homeTeamImage: homeTeamImage,
            awayTeamId: awayTeamId,
            awayTeam: awayTeam,
            awayTeamImage: awayTeamImage,
            homeTeamWinCount: homeTeamWinCount,
            awayTeamWinCount: awayTeamWinCount,
            winnerId: winnerId
        )
        
        return scheduleTableViewCellModel
    }
    
    func getTeam(totalName: String) -> (homeTeam: String, awayTeam: String) {
        let nameArray1 = totalName.components(separatedBy: ":")
        let nameArray2 = nameArray1[nameArray1.count - 1].components(separatedBy: "vs")
        let homeTeam = nameArray2[0].replacingOccurrences(of: " ", with: "")
        let awayTeam = nameArray2[1].replacingOccurrences(of: " ", with: "")
        
        return (homeTeam, awayTeam)
    }
}
